//
//  WrappedRNView.h
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/12.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WrappedRNView : UIView

/*
 info作为ios.index.js中的props
 导出的ReactNativeView根据info展示不同的View
*/
-(void)loadRNViewWithInfo:(NSDictionary *)info;

@end
