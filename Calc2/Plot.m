//
//  Plot.m
//  Calc2
//
//  Created by admin on 7/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ExpressionHandler.h"
#import "Plot.h"
#import "SecondViewController.h"

@implementation Plot


- (void)drawRect:(CGRect)rect
{
    [super drawRect:CGRectMake(0, 0, 0, 0)];
    
    // Create a gradient
    CGFloat colors [] = {
        20/255., 20/255., 46/255., 1.0,
        140/255.0, 117/255., 282/255., 1.0 //red green blue alpha (0.0 - 1.0) x/255.
     
    };
    
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextSaveGState(context);
//    CGContextAddEllipseInRect(context, rect);
//    CGContextClip(context);
//    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient), gradient = NULL;
    
//    CGContextRestoreGState(context);
    
//    CGContextAddEllipseInRect(context, rect);
//    CGContextDrawPath(context, kCGPathStroke);
    
//    CGColorRef yellow = [[UIColor yellowColor] CGColor];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextClearRect(context, rect); // Очистим context
    
//    CGContextRef context = UIGraphicsGetCurrentContext(); очищення
//    CGContextClearRect(context, self.bounds);
    
//    CGContextSetFillColorWithColor(context, yellow);
//    CGContextFillRect(context, CGRectMake(10, 10, 100, 100));
    
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 10, 300);
//    CGContextAddLineToPoint(context, 120, 400);
//    CGContextAddLineToPoint(context, 300, 200);
//    CGContextSetStrokeColorWithColor(context, yellow);
//    CGContextStrokePath(context);
    
//    CGContextClosePath(context);
//    CGContextFillPath(context);
    

//    CGContextSetRGBFillColor(context, 255, 0, 0, 1);
//    CGContextFillRect(context, CGRectMake(20, 20, 100, 100));
//    
//
//    CGContextSetRGBStrokeColor(context, 0, 255, 0, 1);
//    CGContextSetLineWidth(context, 3.0);
//    CGRect circleRect = CGRectMake(140, 20, 100, 100);
//    CGContextStrokeEllipseInRect(context, circleRect);
//    
//    
//    CGContextSetRGBFillColor(context, 0, 0, 255, 1);
//    CGContextFillEllipseInRect(context, CGRectMake(30, 140, 80, 80));
//    
//    CGContextSetRGBStrokeColor(context, 255, 0, 255, 1);
//    CGPoint points[6] = {CGPointMake(70, 20), CGPointMake(120, 120),
//        CGPointMake(120, 120), CGPointMake(20, 120),
//        CGPointMake(20, 120), CGPointMake(70, 20)};
//    CGContextStrokeLineSegments(context, points, 6);
//    
////    CGPoint bezierStart = {20, 260};
////    CGPoint bezierEnd = {300, 260};
////    CGPoint bezierHelper1 = {80, 320};
////    CGPoint bezierHelper2 = {240, 320};
////    CGContextBeginPath(context);
////    CGContextMoveToPoint(context, bezierStart.x, bezierStart.y);
////    CGContextAddCurveToPoint(context,
////        bezierHelper1.x, bezierHelper1.y,
////        bezierHelper2.x, bezierHelper2.y,
////        bezierEnd.x, bezierEnd.y);
////    CGContextStrokePath(context);
//    

//    sin
//    CGContextSetRGBStrokeColor(context, 255, 255, 255, 1);
//    int y;
//    for(int x=rect.origin.x; x < rect.size.width; x++)
//    {
//        y = ((rect.size.height/6) * sin(((x*4) % 360) * M_PI/180)) + 500;
//        if (x == 0) CGContextMoveToPoint(context, x, y);
//        else CGContextAddLineToPoint(context, x, y);
//    }
//    CGContextStrokePath(context);
    
    
    
    
    
    
    CGFloat viewWidth = self.bounds.size.width;
    CGFloat viewHeight = self.bounds.size.height;
    
    //NSString *exp = @"x^3";
    
    CGFloat leftX ;
    CGFloat rightX ;
    
    if ([self.expression containsString:@"√"]) {
        leftX = 0;
        rightX = 10 ;
    }
    else {
        leftX = -3.0;
        rightX = 3.0 ;
    }
    
    
    CGFloat coef;
    CGFloat leastY = 0;
    CGFloat biggestY = 0;
    CGFloat yDiff;
    CGFloat xDiff = rightX - leftX;
    
    

    
    
//    Line in the centre
    CGContextStrokePath(context);
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context,[[UIColor colorWithRed:0.47 green:0.21 blue:0.07 alpha:1.0] CGColor]);
    CGContextMoveToPoint(context, self.frame.size.width/2, 0);
    CGContextAddLineToPoint(context, self.frame.size.width/2, self.frame.size.height);
    CGContextStrokePath(context);
    CGContextBeginPath(context);
//    CGContextSetStrokeColorWithColor(context,[[UIColor colorWithRed:0.98 green:0.98 blue:1.00 alpha:1.0] CGColor]);
    
    CGContextStrokePath(context);
    
    CGContextStrokePath(context);
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context,[[UIColor colorWithRed:0.47 green:0.21 blue:0.07 alpha:1.0] CGColor]);
    CGContextMoveToPoint(context, 0, self.frame.size.height/2);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height/2);
    CGContextStrokePath(context);
    CGContextBeginPath(context);
//    CGContextSetStrokeColorWithColor(context,[[UIColor colorWithRed:0.98 green:0.98 blue:1.00 alpha:1.0] CGColor]);
    
    CGContextStrokePath(context);

//    Graph color
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] CGColor]);
    
    
    BOOL firstTime = YES;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    NSMutableArray *buffer = [[NSMutableArray alloc] init];
    
    for (CGFloat i = leftX; i < rightX; i += 0.1) {
        NSNumber *x = [NSNumber numberWithFloat:i];
        NSString *current = [self.expression stringByReplacingOccurrencesOfString:@"x" withString:[NSString stringWithFormat:@"%lf", i]];
        current = [current stringByReplacingOccurrencesOfString:@"^" withString:@"**"];
        current = [current stringByReplacingOccurrencesOfString:@"√" withString:@"sqrt:"];
//        NSString *
//        NSExpression *expression = [NSExpression expressionWithFormat:current];
//        NSNumber *y = [expression expressionValueWithObject:nil context:nil];
        NSNumber *y = [ExpressionHandler count:current];
        [buffer addObject:[NSValue valueWithCGPoint:CGPointMake([x doubleValue], [y doubleValue])]];
        
        if (firstTime) {
            leastY = [y doubleValue];
            biggestY = [y doubleValue];
            firstTime = NO;
        } else {
            if ([y doubleValue] > biggestY) {
                biggestY = [y doubleValue];
            } else if ([y doubleValue] < leastY) {
                leastY = [y doubleValue];
            }
        }
//        NSLog(@"x : %lf y : %lf ",[x floatValue], [y floatValue]);
    }

    yDiff = biggestY - leastY;
    if (yDiff > xDiff) {
        coef = viewHeight / yDiff;
    } else {
        coef = viewWidth / xDiff;
    }
//    NSLog(@"Least Y : %lf Biggest Y : %lf", leastY, biggestY);
//    NSLog(@"xDiff : %lf yDiff : %lf", xDiff , yDiff);
//    NSLog(@"Coef : %lf", coef);
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSValue *point in buffer) {
        [result addObject:[NSValue valueWithCGPoint:
                           CGPointMake([point CGPointValue].x * coef + viewWidth / 2,
                                       viewHeight / 2 - [point CGPointValue].y * coef)]];
    }
    
    firstTime = YES;
    
    for (NSValue *point in result) {
        
        if (firstTime) {
            [bezierPath moveToPoint:[point CGPointValue]];
            firstTime = NO;
        } else {
            [bezierPath addLineToPoint:[point CGPointValue]];
        }
//        NSLog(@"x value : %lf y value : %lf ", [point CGPointValue].x, [point CGPointValue].y);
    }
    
    [bezierPath stroke];
    
    
    
    
    
    
    
       
   
}


@end
