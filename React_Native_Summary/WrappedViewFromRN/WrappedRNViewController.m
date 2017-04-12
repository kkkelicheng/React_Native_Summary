//
//  WrappedRNViewController.m
//  React_Native_Summary
//
//  Created by licheng ke on 2017/4/12.
//  Copyright © 2017年 licheng ke. All rights reserved.
//

#import "WrappedRNViewController.h"
#import "WrappedRNView.h"

@interface WrappedRNController ()
@property (nonatomic,strong) NSDictionary * pageInfo;
@property (nonatomic,strong) WrappedRNView * rnView;
@end

@implementation WrappedRNController

- (instancetype)initWrappedRNWithInfo:(NSDictionary *)pageInfo{
    if (self = [super init]) {
        _pageInfo = pageInfo;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rnView = [[WrappedRNView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.rnView];
    if (self.pageInfo) {
        [self.rnView loadRNViewWithInfo:self.pageInfo];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
