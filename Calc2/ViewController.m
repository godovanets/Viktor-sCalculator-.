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
    isDecimal = false;
    resultNumber = 0;
    result.adjustsFontSizeToFitWidth = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setResultWithNumber:(int)theNumber {
//    if(!isDecimal){
//        displayNumber *= 10;
//        displayNumber += theNumber;
//        result.text = [NSString stringWithFormat:@"%g", displayNumber];
//        
//    }
//    else {
//        result.text = [result.text stringByAppendingString:[NSString stringWithFormat:@"%d", theNumber]];
//    }
//    displayNumber = [result.text floatValue];
}

- (void) operationWithNumber:(int)theNumber{
//    isDecimal = false;
//    if (resultNumber == 0){
//        resultNumber = displayNumber;
//    }
//    else {
//        result.text = [NSString stringWithFormat:@"%g", resultNumber];
//        switch (operation) {
//            case 1:
//                resultNumber += displayNumber;
//                break;
//            case 2:
//                resultNumber -= displayNumber;
//                break;
//            case 3:
//                resultNumber *= displayNumber;
//                break;
//            case 4:
//                resultNumber /= displayNumber;
//                break;
//            default:
//                break;
//        }
//    }
//    operation = theNumber;
//    displayNumber = 0;    
}

- (IBAction)percent:(id)sender {
    
}

- (IBAction)sqrt:(id)sender {
    
    
    result.text = [NSString stringWithFormat:@"sqrt(%@)", result.text];

}


- (IBAction)exp:(id)sender {
    result.text = [result.text stringByAppendingString:@"^"];

}


- (IBAction)clear:(id)sender {
    operation = 0;
    resultNumber = 0;
    displayNumber = 0;
    isDecimal = false;
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
//    if (resultNumber != 0){
//        [self operationWithNumber:operation];
//        result.text = [NSString stringWithFormat:@"%g", resultNumber];
//        displayNumber = [result.text floatValue];
//        resultNumber = 0;
//    }
//    [self operationWithNumber:4];
    result.text = [result.text stringByAppendingString:@"/"];
}

- (IBAction)multiply:(id)sender {
//    if (resultNumber != 0){
//        [self operationWithNumber:operation];
//        result.text = [NSString stringWithFormat:@"%g", resultNumber];
//        displayNumber = [result.text floatValue];
//        resultNumber = 0;
//    }
//    [self operationWithNumber:3];
    
    result.text = [result.text stringByAppendingString:@"*"];
}

- (IBAction)minus:(id)sender {
//    if (resultNumber != 0){
//        [self operationWithNumber:operation];
//        result.text = [NSString stringWithFormat:@"%g", resultNumber];
//        displayNumber = [result.text floatValue];
//        resultNumber = 0;
//    }
//    [self operationWithNumber:2];
    result.text = [result.text stringByAppendingString:@"-"];
}

- (IBAction)plus:(id)sender {
//    if (resultNumber != 0){
//        [self operationWithNumber:operation];
//        result.text = [NSString stringWithFormat:@"%g", resultNumber];
//        displayNumber = [result.text floatValue];
//        resultNumber = 0;
//    }
//    [self operationWithNumber:1];
    result.text = [result.text stringByAppendingString:@"+"];
}

- (IBAction)equals:(id)sender {
    NSExpression *expression = [NSExpression expressionWithFormat:result.text];
    NSNumber *resultNum = [expression expressionValueWithObject:nil context:nil];
    result.text = [NSString stringWithFormat:@"%@", resultNum];
}

- (IBAction)back:(id)sender {
}

- (IBAction)dot:(id)sender {
//    //isDecimal = true;
//    NSRange range = [result.text rangeOfString:@"."];
//    if(range.location == NSNotFound){
//
//    }
    result.text = [result.text stringByAppendingString:@"."];
}

- (IBAction)zero:(id)sender {
    //result.text = [result.text stringByAppendingString:@"0"];
    if ([result.text isEqual:@"0"]) {
        
        result.text = @"0";
    }
    else {
        result.text = [NSString stringWithFormat:@"%@0", result.text];
    }

}

- (IBAction)one:(id)sender {
    //result.text = [result.text stringByAppendingString:@"1"];
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

//- (IBAction)plusminus:(id)sender {
////    displayNumber = 0 - displayNumber;
////    if (isDecimal) {
////        result.text = [NSString stringWithFormat:@"%g", displayNumber];
////    } else {
////        result.text = [NSString stringWithFormat:@"%g", displayNumber];
////
////    }
//}
@end
