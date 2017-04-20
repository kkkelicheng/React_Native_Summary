//
//  WrappedRNViewController.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/12.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "WrappedRNController.h"
#import "WrappedRNView.h"
#import "ExportedRNController.h"

@interface WrappedRNController ()
@property (nonatomic,strong) NSDictionary * pageInfo;
@property (nonatomic,strong) WrappedRNView * rnView;
@end

@implementation WrappedRNController

- (instancetype)initWrappedRNWithInfo:(NSDictionary *)pageInfo{
    if (self = [super init]) {
        _pageInfo = pageInfo;
        return self;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tempController = self;
    
    self.rnView = [[WrappedRNView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.rnView];
    if (self.pageInfo) {
        [self.rnView loadRNViewWithInfo:self.pageInfo];
    }
}

- (void)receiveRNMsg:(NSNotification *)noti{
    NSDictionary * info = noti.userInfo;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"info : %@",info);
        self.rnView = nil;
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
