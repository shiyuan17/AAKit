//
//  AAIBView.m
//  SXYZProject
//
//  Created by A on 16/7/8.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAIBView.h"

IB_DESIGNABLE
@implementation AAIBView
- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}
@end
