//
//  WrappedRNView.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/12.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "WrappedRNView.h"
#import <React/RCTRootView.h>

@interface WrappedRNView()

@property(nonatomic,strong) NSDictionary * info;

@end


@implementation WrappedRNView

-(void)loadRNViewWithInfo:(NSDictionary *)info{
    
    if (!info) return;
    
    self.info = info;
    NSArray * subViews = [self subviews];
    for (UIView * view in subViews) {
        [view removeFromSuperview];
    }
    
    //设置加载的资源路径
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
    
    //加载ReactNativeView
    RCTRootView * reactNativeView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"ReactNativeView"
                                                 initialProperties:self.info
                                                     launchOptions:nil];
    
    [self addSubview:reactNativeView];
    //将ReactNativeView加入到自己的视图，设置约束
    
    reactNativeView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = @{@"reactNativeView": reactNativeView};
    NSArray *constraints = @[];
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[reactNativeView]-0-|" options:0 metrics:nil views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactNativeView]-0-|" options:0 metrics:nil views:views]];
    
    [self addConstraints:constraints];
    [self layoutIfNeeded];
    
}


@end
