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

- (void)drawRect:(CGRect)rect {
  [super drawRect:CGRectMake(0, 0, 0, 0)];

  // Create a gradient
  CGFloat colors[] = {20 / 255.,   20 / 255.,  46 / 255.,  1.0,
                      140 / 255.0, 117 / 255., 282 / 255., 1.0};

  CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
  CGGradientRef gradient =
      CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
  CGColorSpaceRelease(baseSpace), baseSpace = NULL;

  CGContextRef context = UIGraphicsGetCurrentContext();

  CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
  CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));

  CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
  CGGradientRelease(gradient), gradient = NULL;

  CGFloat viewWidth = self.bounds.size.width;
  CGFloat viewHeight = self.bounds.size.height;
  CGFloat leftX;
  CGFloat rightX;

  if ([self.expression containsString:@"√"]) {
    leftX = 0;
    rightX = 10;
  } else {
    leftX = -3.0;
    rightX = 3.0;
  }

  CGFloat coef;
  CGFloat leastY = 0;
  CGFloat biggestY = 0;
  CGFloat yDiff;
  CGFloat xDiff = rightX - leftX;

  //    Line in the centre
  CGContextStrokePath(context);
  CGContextBeginPath(context);
  CGContextSetStrokeColorWithColor(
      context,
      [[UIColor colorWithRed:0.47 green:0.21 blue:0.07 alpha:1.0] CGColor]);
  CGContextMoveToPoint(context, self.frame.size.width / 2, 0);
  CGContextAddLineToPoint(context, self.frame.size.width / 2,
                          self.frame.size.height);
  CGContextStrokePath(context);

  CGContextStrokePath(context);
  CGContextBeginPath(context);
  CGContextSetStrokeColorWithColor(
      context,
      [[UIColor colorWithRed:0.47 green:0.21 blue:0.07 alpha:1.0] CGColor]);
  CGContextMoveToPoint(context, 0, self.frame.size.height / 2);
  CGContextAddLineToPoint(context, self.frame.size.width,
                          self.frame.size.height / 2);
  CGContextStrokePath(context);

  //    Graph color

  CGContextSetStrokeColorWithColor(
      context, [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] CGColor]);

  BOOL firstTime = YES;

  UIBezierPath *bezierPath = [UIBezierPath bezierPath];

  NSMutableArray *buffer = [[NSMutableArray alloc] init];

  for (CGFloat i = leftX; i < rightX; i += 0.1) {
    NSNumber *x = [NSNumber numberWithFloat:i];
    NSString *current = [self.expression
        stringByReplacingOccurrencesOfString:@"x"
                                  withString:[NSString
                                                 stringWithFormat:@"%lf", i]];
    current =
        [current stringByReplacingOccurrencesOfString:@"^" withString:@"**"];
    current = [current stringByReplacingOccurrencesOfString:@"√"
                                                 withString:@"sqrt:"];

    NSNumber *y = [ExpressionHandler count:current];
    [buffer addObject:[NSValue valueWithCGPoint:CGPointMake([x doubleValue],
                                                            [y doubleValue])]];

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
  }

  yDiff = biggestY - leastY;
  if (yDiff > xDiff) {
    coef = viewHeight / yDiff;
  } else {
    coef = viewWidth / xDiff;
  }

  NSMutableArray *result = [[NSMutableArray alloc] init];

  for (NSValue *point in buffer) {
    [result
        addObject:[NSValue
                      valueWithCGPoint:CGPointMake(
                                           [point CGPointValue].x * coef +
                                               viewWidth / 2,
                                           viewHeight / 2 -
                                               [point CGPointValue].y * coef)]];
  }

  firstTime = YES;

  for (NSValue *point in result) {
    if (firstTime) {
      [bezierPath moveToPoint:[point CGPointValue]];
      firstTime = NO;
    } else {
      [bezierPath addLineToPoint:[point CGPointValue]];
    }
  }

  [bezierPath stroke];
}

@end
