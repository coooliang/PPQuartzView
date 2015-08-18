//
//  TestView.m
//  PPQuartz2DTest
//
//  Created by 陈亮 on 8/1/15.
//  Copyright (c) 2015 coooliang. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self drawLine:CGPointMake(20, 20) endPoint:CGPointMake(50, 50)];
        [self drawLine:CGPointMake(20, 40) endPoint:CGPointMake(50, 50) lineWidth:2 color:[UIColor redColor]];
        
        [self drawCurveLine:CGPointMake(0, 100) endPoint:CGPointMake(320, 100) curveControlPoint:CGPointMake(160, 200)];
        [self drawCurveLine:CGPointMake(0, 120) endPoint:CGPointMake(320, 120) curveControlPoint:CGPointMake(160, 200) height:3 color:[UIColor blueColor]];
        
        [self drawCircle:CGPointMake(160, 240) radius:10];
        [self drawCircle:CGPointMake(160, 260) radius:10 lineWidth:4 lineColor:[UIColor greenColor]];
    }
    return self;
}

@end
