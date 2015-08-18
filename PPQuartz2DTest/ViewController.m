//
//  ViewController.m
//  PPQuartz2DTest
//
//  Created by 陈亮 on 8/1/15.
//  Copyright (c) 2015 coooliang. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestView * view = [[TestView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
