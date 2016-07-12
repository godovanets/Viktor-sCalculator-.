//
//  ViewController.m
//  Calc2
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"
#import "ExpressionHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    result.text = @"0";
    result.adjustsFontSizeToFitWidth = TRUE;
    result.hidden = NO ;
    
//    Gradient
    CAGradientLayer *gradient = [CAGradientLayer layer];
    CGRect gradientFrame = self.view.bounds;
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    if (viewHeight > viewWidth) {
        gradientFrame.size.height = viewHeight;
        gradientFrame.size.width = viewHeight;
    } else {
        gradientFrame.size.height = viewWidth;
        gradientFrame.size.width = viewWidth;
    }
    gradient.frame = gradientFrame;
    UIColor *blueViolet =
    [UIColor colorWithRed:140/255.0 green:117/255.0 blue:282/255.0 alpha:1.0];
    UIColor *darkViolet =
    [UIColor colorWithRed:20/255.0 green:13/255.0 blue:46/255.0 alpha:1.0];
    gradient.colors =
    [NSArray arrayWithObjects:(id)[darkViolet CGColor],
     (id)[blueViolet CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)percent:(id)sender {
//    result.text = [ NSString stringWithFormat:@"%g", ([result.text doubleValue] / 100)];
    
    if ([result.text isEqual:@"0"]) {
        result.text = @"x";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@x", result.text];
    }
}

- (IBAction)sqrt:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"√(";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@√(", result.text];
    }
    
}


- (IBAction)exp:(id)sender {
    result.text = [result.text stringByAppendingString:@"^"];
}


- (IBAction)clear:(id)sender {
    result.text = [NSString stringWithFormat:@"%i",0];
     
}

- (IBAction)bracket1:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"(";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@(", result.text];
    }
     
}

- (IBAction)bracket2:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @")";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@)", result.text];
    }
     
}

- (IBAction)divide:(id)sender {
    result.text = [result.text stringByAppendingString:@"/"];
     
}

- (IBAction)multiply:(id)sender {
    result.text = [result.text stringByAppendingString:@"*"];
     
}

- (IBAction)minus:(id)sender {
    result.text = [result.text stringByAppendingString:@"-"];
     
}

- (IBAction)plus:(id)sender {
    result.text = [result.text stringByAppendingString:@"+"];
}

- (IBAction)equals:(id)sender {
    if (![result.text containsString:@"x"]) {
        result.text = [NSString stringWithFormat:@"%g", [[self evaluateArithmeticStringExpression:result.text] doubleValue]];
    }
}

- (IBAction)back:(id)sender {
    long unsigned length = (long unsigned)[result.text length];
    if (![result.text isEqualToString:@"0"]) {
        if (length > 1) {
            result.text = [result.text substringToIndex:length - 1];
        } else {
            result.text = @"0";
        }
    }
}

- (IBAction)dot:(id)sender {
    result.text = [result.text stringByAppendingString:@"."];
     
}

- (IBAction)zero:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"0";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@0", result.text];
    }
}

- (IBAction)one:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"1";
    }
    else {
    result.text = [NSString stringWithFormat:@"%@1", result.text];
    }
}

- (IBAction)two:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"2";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@2", result.text];
    }
}

- (IBAction)three:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"3";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@3", result.text];
    }
}

- (IBAction)four:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"4";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@4", result.text];
    }
}

- (IBAction)five:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"5";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@5", result.text];
    }
}

- (IBAction)six:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"6";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@6", result.text];
    }
}

- (IBAction)seven:(id)sender {
    if ([result.text isEqual:@"0"]) {
        result.text = @"7";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@7", result.text];
    }
}

- (IBAction)eight:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"8";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@8", result.text];
    }
}

- (IBAction)nine:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"9";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@9", result.text];
    }
}

- (IBAction)sin:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"sin(";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@sin(", result.text];
    }
}

- (IBAction)cos:(id)sender {
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"cos(";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@cos(", result.text];
    }

}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"Line 212 entered. Segue identifier : %@", segue.identifier);
//    if([segue.identifier isEqualToString:@"plotSegue"]){
//        NSLog(@"View controller : %@", result.text);
        SecondViewController *secondController = [segue destinationViewController];
    //[secondController setPlotExpression:result.text];
    secondController.tempBufferForExpression = result.text;
//    }
}

- (NSNumber *)evaluateArithmeticStringExpression:(NSString *)expression {
    
    NSNumber *calculatedResult = nil;
    expression = [expression stringByReplacingOccurrencesOfString:@"^" withString:@"**"];
    expression = [expression stringByReplacingOccurrencesOfString:@"√" withString:@"sqrt:"];
    while ([expression containsString:@"sin"] || [expression containsString:@"cos"]) {
        expression = [ExpressionHandler processExpression:expression];
    }
    @try {
        NSPredicate * parsed = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"1.0 * %@ = 0", expression]];
        NSExpression * left = [(NSComparisonPredicate *)parsed leftExpression];
        calculatedResult = [left expressionValueWithObject:nil context:nil];
    }
    @catch (NSException *exception) {
        
        NSLog(@"Input is not an expression...!");
        
    }
    @finally {
        return calculatedResult;
    }
}

@end
