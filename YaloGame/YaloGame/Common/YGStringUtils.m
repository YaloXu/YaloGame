//
//  YGStringUtils.m
//  YaloGame
//
//  Created by maomao on 2018/11/27.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGStringUtils.h"

@implementation YGStringUtils
+ (NSMutableAttributedString *)setAttributedString:(NSString *)totalString lineSpace:(CGFloat)lineSpace attributes1:(NSDictionary <NSString *, id>*)attributes1 range1:(NSRange)range1 attributes2:(NSDictionary <NSString *, id>*)attributes2 range2:(NSRange)range2 attributes3:(NSDictionary <NSString *, id>*)attributes3 range3:(NSRange)range3 attributes4:(NSDictionary <NSString *, id>*)attributes4 range4:(NSRange)range4 attributes5:(NSDictionary <NSString *, id>*)attributes5 range5:(NSRange)range5 {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:totalString];
    if (lineSpace > 0) {
        NSMutableParagraphStyle *paragraphStyle =
        [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        [attString addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, totalString.length)];
    }
    if (attributes1) {
        [attString addAttributes:attributes1 range:range1];
    }
    if (attributes2) {
        [attString addAttributes:attributes2 range:range2];
    }
    if (attributes3) {
        [attString addAttributes:attributes3 range:range3];
    }
    if (attributes4) {
        [attString addAttributes:attributes4 range:range4];
    }
    if (attributes5) {
        [attString addAttributes:attributes5 range:range5];
    }
    return attString;
}
@end
