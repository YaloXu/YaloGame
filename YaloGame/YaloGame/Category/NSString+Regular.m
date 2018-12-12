//
//  NSString+Regular.m
//  YaloGame
//
//  Created by C on 2018/12/12.
//  Copyright © 2018 C. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

- (BOOL)validatePhoneNumber {
    NSString *phoneNumberRegixSimple = @"^1\\d{10}";
    return [self isValidateByRegex:phoneNumberRegixSimple];
}

- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end
