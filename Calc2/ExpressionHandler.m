//
//  ExpressionHandler.m
//  Calc2
//
//  Created by admin on 7/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionHandler.h"

@implementation ExpressionHandler

+ (NSInteger)substringLength:(NSString *)expression {
    NSNumber *openingParenthesis = [NSNumber numberWithChar:'('];
    NSNumber *closingParenthesis = [NSNumber numberWithChar:')'];
    NSInteger pairCount = 1;
    for (NSInteger i = 0; i < [expression length]; ++i) {
        if ([expression characterAtIndex:i] == [openingParenthesis charValue]) {
            ++pairCount;
        } else if ([expression characterAtIndex:i] ==
                   [closingParenthesis charValue]) {
            --pairCount;
        }
        if (pairCount == 0) {
            return i;
        }
    }
    return -1;
}

+ (NSString *)processExpression:(NSString *)expression {
    if ([expression containsString:@"sin"] ||
        [expression containsString:@"cos"]) {
        if ([expression containsString:@"sin"] &&
            [expression containsString:@"cos"]) {
            if ([expression rangeOfString:@"sin"].location <
                [expression rangeOfString:@"cos"].location) {
                NSInteger startOfSubstring =
                [expression rangeOfString:@"sin"].location + @"sin(".length;
                NSInteger substringLength = [self
                                             substringLength:[expression substringFromIndex:startOfSubstring]];
                NSString *substringExpression = [expression
                                                 substringWithRange:NSMakeRange(startOfSubstring, substringLength)];
                NSString *recuringString = [self processExpression:substringExpression];
                NSExpression *exp = [NSExpression expressionWithFormat:recuringString];
                NSNumber *result = [exp expressionValueWithObject:nil context:nil];
                NSInteger startOfReplacement =
                [expression rangeOfString:@"sin"].location;
                NSInteger replacementLength = substringLength + @"sin(".length + 1;
                NSString *replacementString =
                [NSString stringWithFormat:@"%lf", sin([result doubleValue])];
                NSString *processedExpression = [expression
                                                 stringByReplacingCharactersInRange:NSMakeRange(startOfReplacement,
                                                                                                replacementLength)
                                                 withString:replacementString];
                return processedExpression;
            } else {
                NSInteger startOfSubstring =
                [expression rangeOfString:@"cos"].location + @"cos(".length;
                NSInteger substringLength = [self
                                             substringLength:[expression substringFromIndex:startOfSubstring]];
                NSString *substringExpression = [expression
                                                 substringWithRange:NSMakeRange(startOfSubstring, substringLength)];
                NSString *recuringString = [self processExpression:substringExpression];
                NSExpression *exp = [NSExpression expressionWithFormat:recuringString];
                NSNumber *result = [exp expressionValueWithObject:nil context:nil];
                NSInteger startOfReplacement =
                [expression rangeOfString:@"cos"].location;
                NSInteger replacementLength = substringLength + @"cos(".length + 1;
                NSString *replacementString =
                [NSString stringWithFormat:@"%lf", cos([result doubleValue])];
                NSString *processedExpression = [expression
                                                 stringByReplacingCharactersInRange:NSMakeRange(startOfReplacement,
                                                                                                replacementLength)
                                                 withString:replacementString];
                return processedExpression;
            }
        } else if ([expression containsString:@"sin"] &&
                   ![expression containsString:@"cos"]) {
            NSInteger startOfSubstring =
            [expression rangeOfString:@"sin"].location + @"sin(".length;
            NSInteger substringLength = [self
                                         substringLength:[expression substringFromIndex:startOfSubstring]];
            NSString *substringExpression = [expression
                                             substringWithRange:NSMakeRange(startOfSubstring, substringLength)];
            NSString *recuringString = [self processExpression:substringExpression];
            NSExpression *exp = [NSExpression expressionWithFormat:recuringString];
            NSNumber *result = [exp expressionValueWithObject:nil context:nil];
            NSInteger startOfReplacement = [expression rangeOfString:@"sin"].location;
            NSInteger replacementLength = substringLength + @"sin(".length + 1;
            NSString *replacementString =
            [NSString stringWithFormat:@"%lf", sin([result doubleValue])];
            NSString *processedExpression = [expression
                                             stringByReplacingCharactersInRange:NSMakeRange(startOfReplacement,
                                                                                            replacementLength)
                                             withString:replacementString];
            return processedExpression;
        } else if ([expression containsString:@"cos"] &&
                   ![expression containsString:@"sin"]) {
            NSInteger startOfSubstring =
            [expression rangeOfString:@"cos"].location + @"cos(".length;
            NSInteger substringLength = [self
                                         substringLength:[expression substringFromIndex:startOfSubstring]];
            NSString *substringExpression = [expression
                                             substringWithRange:NSMakeRange(startOfSubstring, substringLength)];
            NSString *recuringString = [self processExpression:substringExpression];
            NSExpression *exp = [NSExpression expressionWithFormat:recuringString];
            NSNumber *result = [exp expressionValueWithObject:nil context:nil];
            NSInteger startOfReplacement = [expression rangeOfString:@"cos"].location;
            NSInteger replacementLength = substringLength + @"cos(".length + 1;
            NSString *replacementString =
            [NSString stringWithFormat:@"%lf", cos([result doubleValue])];
            NSString *processedExpression = [expression
                                             stringByReplacingCharactersInRange:NSMakeRange(startOfReplacement,
                                                                                            replacementLength)
                                             withString:replacementString];
            return processedExpression;
        }
    }
    NSExpression *exp = [NSExpression expressionWithFormat:expression];
    NSNumber *result = [exp expressionValueWithObject:nil context:nil];
    NSString *processedExpression =
    [NSString stringWithFormat:@"%lf", [result doubleValue]];
    return processedExpression;
}

+ (NSNumber *)count:(NSString *)expression {
    if ([expression containsString:@"cos"] || [expression containsString:@"sin"]) {
        while ([expression containsString:@"sin"] ||
               [expression containsString:@"cos"]) {
            expression = [self processExpression:expression];
        }
    }
    return [[NSExpression expressionWithFormat:expression]
            expressionValueWithObject:nil
            context:nil];
}

@end
