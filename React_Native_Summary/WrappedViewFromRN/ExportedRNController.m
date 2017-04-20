//
//  ExportedRNController.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/17.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "ExportedRNController.h"
#import "RNPushNativeController.h"


NSString * const RNNotificationName = @"RNNotificationName";
UIViewController * tempController = nil;

@interface ExportedRNController ()

@end

@implementation ExportedRNController

RCT_EXPORT_MODULE();



RCT_EXPORT_METHOD(addEvent:(NSString *)name info:(NSDictionary *)info)
{
    NSLog(@"\n EventName:%@ , info:%@  self=%@\n",name,info,self);

    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([name isEqualToString:@"pop"]) {
            if (self.viewController && self.viewController.navigationController){
                    [self.viewController.navigationController popViewControllerAnimated:YES];
            }
        }
        else if ([name isEqualToString:@"push"]){
            
            /*当然这里要push的类是已经写好了的，并且是RNPushNativeController或者它的子类。
             因为，后面有传入info信息。如果是自己定制Controller也可以。
             */
            NSString * controllerName = info[@"ControllerName"];
            RNPushNativeController * controller = [[NSClassFromString(controllerName) alloc]init];
            controller.info = info;
            if (self.viewController && self.viewController.navigationController){
                [self.viewController.navigationController pushViewController:controller animated:YES];
            }
        }
        
    });
}


//这里是js端调用初始化的。
- (instancetype)init{
    NSLog(@"调用初始化");
    if (self = [super init]) {
        self.viewController = tempController;
        return self;
    }
    return nil;
}




@end
