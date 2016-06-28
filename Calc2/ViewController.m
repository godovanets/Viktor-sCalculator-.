//
//  ViewController.m
//  Calc2
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    result.text = @"";
    result.adjustsFontSizeToFitWidth = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)percent:(id)sender {
    result.text = [ NSString stringWithFormat:@"%g", ([result.text doubleValue] / 100)];
    
}

- (IBAction)sqrt:(id)sender {
  result.text = [NSString stringWithFormat:@"√(%@)", result.text];
    
//  _outputText = [NSString stringWithFormat:@"sqrt(%@)",result.text];
//    result.text = [NSString stringWithFormat:@"√%@",result.text];
    
     
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
        result.text = [NSString stringWithFormat:@"%g", [[self evaluateArithmeticStringExpression:result.text] doubleValue]];
     
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

- (NSNumber *)evaluateArithmeticStringExpression:(NSString *)expression {
    
    NSNumber *calculatedResult = nil;
    expression = [expression stringByReplacingOccurrencesOfString:@"^" withString:@"**"];
    expression = [expression stringByReplacingOccurrencesOfString:@"√" withString:@"sqrt:"];
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
