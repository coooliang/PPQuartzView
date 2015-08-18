//
//  UIView+PPQuartzView.m
//  PPQuartz2DTest
//
//  Created by 陈亮 on 8/1/15.
//  Copyright (c) 2015 coooliang. All rights reserved.
//

#import "UIView+PPQuartzView.h"

@implementation UIView (PPQuartzView)

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect...");
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    drawBody(ctx, rect);
}

void drawBody(CGContextRef ctx, CGRect rect){
    // 上半圆
    CGFloat topX = rect.size.width * 0.5;
    CGFloat topY = 2;
    CGFloat topRadius = 40;
    CGContextAddArc(ctx, topX, topY, topRadius, 0, M_PI, 1);
    
    // 向下延伸
    CGFloat middleX = topX - topRadius;
    CGFloat middleH = 100; // 中间身体的高度
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(ctx, middleX, middleY);
    
    // 下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    // 合并路径
    CGContextClosePath(ctx);
    
    // 设置颜色
    [[UIColor redColor] set];
    
    // 利用填充方式画出之前的路径
    CGContextFillPath(ctx);
}

@end
