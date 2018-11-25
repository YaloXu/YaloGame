//
//  CALayer+Border.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "CALayer+Border.h"

@implementation CALayer (Border)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (void)setBorderUIWidth:(CGFloat)width {
    self.borderWidth = width;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

- (CGFloat)borderUIWidth {
    return self.borderWidth;
}


@end
