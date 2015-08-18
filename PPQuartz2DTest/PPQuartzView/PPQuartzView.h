//
//  PPQuartzView.h
//
//  Created by Coooliang on 8/1/15.
//  Copyright (c) 2015 coooliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPQuartzView : UIView


-(void)drawLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
-(void)drawLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(NSUInteger)lineWidth color:(UIColor *)color;


-(void)drawCurveLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint curveControlPoint:(CGPoint)curveControlPoint;
-(void)drawCurveLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint curveControlPoint:(CGPoint)curveControlPoint height:(NSUInteger)lineWidth color:(UIColor *)color;

-(void)drawCircle:(CGPoint)centerPoint radius:(CGFloat)radius;
-(void)drawCircle:(CGPoint)centerPoint radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)color;
@end
