//
//  YGDateTools.m
//  YaloGame
//
//  Created by C on 2018/12/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGDateTools.h"

@implementation YGDateTools

+ (NSString *)formatDateTimeInterval:(NSTimeInterval)timeInterval formatString:(NSString *)formatString {
    if (!YGUtils.validString(formatString)) {
        formatString = @"YYYY-MM-dd mm:HH";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatString;
    return [dateFormatter stringFromDate:date];
}

@end
