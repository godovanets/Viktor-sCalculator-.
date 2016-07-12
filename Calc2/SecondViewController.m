//
//  SecondViewController.m
//  Calc2
//
//  Created by admin on 6/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "SecondViewController.h"
#import "Plot.h"

@implementation SecondViewController
- (void) viewDidLoad {
    [super viewDidLoad];
  self.myViewForPlot = [[Plot alloc] initWithFrame:self.view.bounds];
    //self.myViewForPlot = [[Plot alloc] initWithFrame:self.view.bounds];
    [self.myViewForPlot setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.myViewForPlot];
    
    self.myViewForPlot.expression = self.tempBufferForExpression;
    
//    CAGradientLayer *gradient = [CAGradientLayer layer];   //gradient
//    CGRect gradientFrame = self.view.bounds;
//    CGFloat viewWidth = self.view.bounds.size.width;
//    CGFloat viewHeight = self.view.bounds.size.height;
//    if (viewHeight > viewWidth) {
//        gradientFrame.size.height = viewHeight;
//        gradientFrame.size.width = viewHeight;
//    } else {
//        gradientFrame.size.height = viewWidth;
//        gradientFrame.size.width = viewWidth;
//    }
//    gradient.frame = gradientFrame;
//    UIColor *blueViolet =
//    [UIColor colorWithRed:140/255.0 green:117/255.0 blue:282/255.0 alpha:1.0];
//    UIColor *darkViolet =
//    [UIColor colorWithRed:20/255.0 green:13/255.0 blue:46/255.0 alpha:1.0];
//    gradient.colors =
//    [NSArray arrayWithObjects:(id)[darkViolet CGColor],
//     (id)[blueViolet CGColor], nil];
//    self.myViewForPlot.layer.zPosition = -1;
//    [self.myViewForPlot.layer insertSublayer:gradient atIndex:-1];


    
}

//- (void)setPlotExpression:(NSString *)plotExpression {
//    NSLog(@"%@", plotExpression);
//    
//    self.tempBufferForExpression = plotExpression;
//    self.myViewForPlot.expression = plotExpression;
//      
//    
//}

@end
