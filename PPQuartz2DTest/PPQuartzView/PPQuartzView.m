//
//  PPQuartzView.m
//
//  Created by Coooliang on 8/1/15.
//  Copyright (c) 2015 coooliang. All rights reserved.
//

#import "PPQuartzView.h"


#define DRAW_MODEL_LINE_TYPE 1
#define DRAW_MODEL_CURVE_TYPE 2
#define DRAW_MODEL_CIRCLE_TYPE 3
@interface PPQuartzViewModel : NSObject
@property (nonatomic,assign)BOOL drawFlag;
@property (nonatomic,assign)int drawType;
@property (nonatomic,assign)CGPoint startPoint;
@property (nonatomic,assign)CGPoint endPoint;
@property (nonatomic,assign)NSUInteger lineWidth;
@property (nonatomic,strong)UIColor *lineColor;
@property (nonatomic,assign)CGPoint curveControlPoint;
@property (nonatomic,assign)CGPoint circleCenterPoint;
@property (nonatomic,assign)CGFloat circleRadius;
@end
@implementation PPQuartzViewModel : NSObject


@end

@implementation PPQuartzView{
    NSMutableArray *modelArray;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        modelArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (PPQuartzViewModel *model in modelArray) {
        int type = model.drawType;
        switch (type) {
            case DRAW_MODEL_LINE_TYPE:
                [self drawLine:model rect:rect ctx:ctx];
                break;
            case DRAW_MODEL_CURVE_TYPE:
                [self drawCurveLine:model rect:rect ctx:ctx];
                break;
            case DRAW_MODEL_CIRCLE_TYPE:
                [self drawCircle:model rect:rect ctx:ctx];
                break;
            default:
                break;
        }
    }
}

#pragma mark - draw line
//public methods
-(void)drawLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    [self drawLine:startPoint endPoint:endPoint lineWidth:1 color:[UIColor blackColor]];
}

-(void)drawLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(NSUInteger)lineWidth color:(UIColor *)color{
    PPQuartzViewModel *lineModel = [[PPQuartzViewModel alloc]init];
    lineModel.drawType = DRAW_MODEL_LINE_TYPE;
    
    lineModel.drawFlag = YES;
    lineModel.startPoint = startPoint;
    lineModel.endPoint = endPoint;
    lineModel.lineWidth = lineWidth;
    lineModel.lineColor = color;
    [modelArray addObject:lineModel];
}
//private method
-(void)drawLine:(PPQuartzViewModel *)lineModel rect:(CGRect)rect ctx:(CGContextRef)ctx{
    if(lineModel.drawFlag){
        CGContextMoveToPoint(ctx, lineModel.startPoint.x, lineModel.startPoint.y);
        CGContextAddLineToPoint(ctx, lineModel.endPoint.x, lineModel.endPoint.y);
        CGContextSetLineWidth(ctx, lineModel.lineWidth);
        [lineModel.lineColor set];
        CGContextStrokePath(ctx);
    }
}

#pragma mark - draw curve line
-(void)drawCurveLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint curveControlPoint:(CGPoint)curveControlPoint{
    [self drawCurveLine:startPoint endPoint:endPoint curveControlPoint:curveControlPoint height:1 color:[UIColor blackColor]];
}

-(void)drawCurveLine:(CGPoint)startPoint endPoint:(CGPoint)endPoint curveControlPoint:(CGPoint)curveControlPoint height:(NSUInteger)lineWidth color:(UIColor *)color{
    PPQuartzViewModel *curveLineModel = [[PPQuartzViewModel alloc]init];
    curveLineModel.drawType = DRAW_MODEL_CURVE_TYPE;
    curveLineModel.drawFlag = YES;
    curveLineModel.startPoint = startPoint;
    curveLineModel.endPoint = endPoint;
    curveLineModel.lineWidth = lineWidth;
    curveLineModel.lineColor = color;
    curveLineModel.curveControlPoint = curveControlPoint;
    [modelArray addObject:curveLineModel];
}

//private method
-(void)drawCurveLine:(PPQuartzViewModel *)curveLineModel rect:(CGRect)rect ctx:(CGContextRef)ctx{
    if(curveLineModel.drawFlag){
        CGContextMoveToPoint(ctx, curveLineModel.startPoint.x, curveLineModel.startPoint.y);
        CGContextAddQuadCurveToPoint(ctx,curveLineModel.curveControlPoint.x ,curveLineModel.curveControlPoint.y, curveLineModel.endPoint.x, curveLineModel.endPoint.y);
        CGContextSetLineWidth(ctx, curveLineModel.lineWidth);
        [curveLineModel.lineColor set];
        CGContextStrokePath(ctx);
    }
}

#pragma mark - draw circle
-(void)drawCircle:(CGPoint)centerPoint radius:(CGFloat)radius{
    [self drawCircle:centerPoint radius:radius lineWidth:1 lineColor:[UIColor blackColor]];
}
-(void)drawCircle:(CGPoint)centerPoint radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)color{
    PPQuartzViewModel *circleModel = [[PPQuartzViewModel alloc]init];
    circleModel.drawType = DRAW_MODEL_CIRCLE_TYPE;
    circleModel.drawFlag = YES;
    circleModel.circleCenterPoint = centerPoint;
    circleModel.circleRadius = radius;
    circleModel.lineWidth = lineWidth;
    circleModel.lineColor = color;
    [modelArray addObject:circleModel];
}

//private method
-(void)drawCircle:(PPQuartzViewModel *)circleModel rect:(CGRect)rect ctx:(CGContextRef)ctx{
    if(circleModel.drawFlag){
        CGContextAddArc(ctx, circleModel.circleCenterPoint.x, circleModel.circleCenterPoint.y, circleModel.circleRadius, M_PI, 360* M_PI/180, 0);
        CGContextAddArc(ctx, circleModel.circleCenterPoint.x, circleModel.circleCenterPoint.y, circleModel.circleRadius, 360* M_PI/180,M_PI , 0);
        [circleModel.lineColor set];
        CGContextSetLineWidth(ctx, circleModel.lineWidth);
        CGContextStrokePath(ctx);
        

    }
}
@end
