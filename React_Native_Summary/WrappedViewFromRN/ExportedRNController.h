//
//  ExportedRNController.h
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/17.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "WrappedRNController.h"
#import <React/RCTBridgeModule.h>

extern NSString * const RNNotificationName;
extern UIViewController * tempController ;


/**
 导出给JS用的类。
 配合WrappedRNController使用，控制WrappedRNController的跳转等等。
 在componentDidMount方法中调用此类，此时WrappedRNController中的view已经加载完。
 this.controller = NativeModules.ExportedRNController;
 */
@interface ExportedRNController : NSObject <RCTBridgeModule>

@property (nonatomic,weak) UIViewController * viewController;

@end
