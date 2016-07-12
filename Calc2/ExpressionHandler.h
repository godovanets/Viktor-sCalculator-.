//
//  ExpressionHandler.h
//  Calc2
//
//  Created by admin on 7/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

#ifndef ExpressionHandler_h
#define ExpressionHandler_h

#import <Foundation/Foundation.h>

@interface ExpressionHandler : NSObject

+ (NSInteger)substringLength:(NSString *)expression;

+ (NSString *)processExpression:(NSString *)expression;

+ (NSNumber *)count:(NSString *)expression;

@end


#endif /* ExpressionHandler_h */
