//
//  RNPushNativeController.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/20.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "RNPushNativeController.h"

@interface RNPushNativeController ()

@end

@implementation RNPushNativeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString * contents = @"";
    if (self.info) {
        for (NSString * key in self.info.allKeys) {
            contents = [contents stringByAppendingString:[@"\n" stringByAppendingString:self.info[key]]];
        }
    }
    NSLog(@"contents : %@",contents);
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 330)];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor yellowColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = contents;
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
