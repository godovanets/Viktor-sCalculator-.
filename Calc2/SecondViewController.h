//
//  SecondViewController.h
//  Calc2
//
//  Created by admin on 6/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plot.h"

@interface SecondViewController : UIViewController

@property(strong, nonatomic) NSString* tempBufferForExpression;

@property(strong, nonatomic) Plot* myViewForPlot;

//- (void)setPlotExpression:(NSString *)plotExpression;

@end
