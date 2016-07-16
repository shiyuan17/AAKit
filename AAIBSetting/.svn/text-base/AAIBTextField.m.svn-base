//
//  AAIBTextField.m
//  SXYZProject
//
//  Created by shiyuan on 16/7/15.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAIBTextField.h"
IB_DESIGNABLE
@implementation AAIBTextField

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

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
}
@end
