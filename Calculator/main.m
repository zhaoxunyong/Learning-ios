//
//  main.m
//  Calculator
//
//  Created by dave on 2019/4/16.
//  Copyright © 2019 dave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import "MathOperations.h"

BOOL isAndOperator(const char value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        double result = 0;
        char operator = '\0';
        
        NSString *equation = [NSString stringWithUTF8String:argv[1]];
        NSArray *eqParts = [equation componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        for(int n = 0; n < [eqParts count]; n++) {
            NSString * argString = [eqParts objectAtIndex:n];
            char firstChar = [argString characterAtIndex:0];
            if(isAndOperator(firstChar)) {
                operator = firstChar;
                continue;
            }
            
            double newValue = [argString doubleValue];
            
            switch (operator) {
                case '+':
                    result = add(result, newValue);
                    break;
                case '-':
                    result = subtract(result, newValue);
                    break;
                case '*':
                    result = multiply(result, newValue);
                    break;
                case '/':
                    result = divide(result, newValue);
                    break;
                default:
                    result = add(result, newValue);
            }
        }
        NSLog(@"%.3f", result);
    }
    return 0;
}
