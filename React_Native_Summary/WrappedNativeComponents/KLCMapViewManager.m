//
//  KLCMapViewManager.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/5/2.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "KLCMapViewManager.h"

//引入UI类
#import "KLCMapView.h"

//引入协议
#import <MapKit/MapKit.h>

//引入一个block类型
#import <React/RCTComponent.h>


@implementation RCTConvert(CoreLocation)

//这里的第一个参数是返回的类型 第二个参数是方法的名 第三个参数[json doubleValue]这样转化
RCT_CONVERTER(CLLocationDegrees, CLLocationDegrees, doubleValue);
RCT_CONVERTER(CLLocationDistance, CLLocationDistance, doubleValue);

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json
{
    json = [self NSDictionary:json];
    return (CLLocationCoordinate2D){
        [self CLLocationDegrees:json[@"latitude"]],
        [self CLLocationDegrees:json[@"longitude"]]
    };
}

@end

@implementation RCTConvert(MapKit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
    json = [self NSDictionary:json];
    return (MKCoordinateSpan){
        [self CLLocationDegrees:json[@"latitudeDelta"]],
        [self CLLocationDegrees:json[@"longitudeDelta"]]
    };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
    return (MKCoordinateRegion){
        [self CLLocationCoordinate2D:json],
        [self MKCoordinateSpan:json]
    };
}

@end


/**
 *
 * 上面是RCTConvert 的一个分类，为NSDictionary到MKCoordinateRegion做转换
 *
 *
 *
 */

@interface KLCMapViewManager()<MKMapViewDelegate>

@end


@implementation KLCMapViewManager

RCT_EXPORT_MODULE();

- (UIView *)view {
    NSLog(@"KLCMapViewManager  load view");
    KLCMapView * view = [[KLCMapView alloc]init];
    view.delegate = self;
    return view;
}

// 普通的类型转换
// 第一个参数是原生的属性名  第二个参数是类型
RCT_EXPORT_VIEW_PROPERTY(pitchEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scrollEnabled, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onRegionChange, RCTBubblingEventBlock)

// 自定义的类型转换
// 第一个参数是原生的属性名  第二个参数是类型 第三个参数是要改变的控件类型
RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, KLCMapView){
    [view setRegion: json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}


//这里不做RCT_EXPORT_METHOD(<#method#>) 的演示，这个是JS调用Native的方法。很简单
// 接下来就是 Native调用 JS ，这里一种是采用AppEventDispatch 第二种是采用block来完成
// 使用block 本质上是也是通过属性来完成调用。所以在原生的控件上需要添加一个block的属性


#pragma mark - mapViewDelegate
- (void)mapView:(KLCMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"regionDidChangeAnimated....");
    
    MKCoordinateRegion region = mapView.region;
    // 这里返回给JS的参数是NSDictionary的，block中已经定义了
    NSDictionary * regionInfo = @{
                                  @"region": @{
                                          @"latitude": @(region.center.latitude),
                                          @"longitude": @(region.center.longitude),
                                          @"latitudeDelta": @(region.span.latitudeDelta),
                                          @"longitudeDelta": @(region.span.longitudeDelta),
                                          }
                                  };
    
    
    //这里如果报错的话，检查一下导出的属性。导出的对不对
    mapView.onRegionChange(regionInfo);
}




@end




/*
 下面是RCTViewManager 中的代码，可以参照一下
 
 RCT_CUSTOM_VIEW_PROPERTY(borderColor, CGColor, RCTView)
 {
 if ([view respondsToSelector:@selector(setBorderColor:)]) {
 view.borderColor = json ? [RCTConvert CGColor:json] : defaultView.borderColor;
 } else {
 view.layer.borderColor = json ? [RCTConvert CGColor:json] : defaultView.layer.borderColor;
 }
 }
 */






