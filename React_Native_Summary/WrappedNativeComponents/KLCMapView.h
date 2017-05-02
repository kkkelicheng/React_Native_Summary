//
//  KLCMapView.h
//  React_Native_Summary
//
//  Created by licheng ke on 2017/5/2.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import <MapKit/MapKit.h>

//导入这个类是为了引入这个 RCTBubblingEventBlock 类型的block
#import <React/RCTComponent.h>

@interface KLCMapView : MKMapView

// 这里的block必须是on开头... react native太坑
@property (nonatomic, copy) RCTBubblingEventBlock onRegionChange;

@end
