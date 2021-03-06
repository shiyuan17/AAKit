//
//  AAIBButton.m
//  SXYZProject
//
//  Created by shiyuan on 16/7/14.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAIBButton.h"

IB_DESIGNABLE
@implementation AAIBButton
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnClick{
    if (_selectColor) {
        if (self.layer.borderColor != _selectColor.CGColor) {
            self.layer.borderColor = _selectColor.CGColor;
            [self setTitleColor:_selectColor forState:UIControlStateNormal];
        }else{
            self.layer.borderColor = _borderColor.CGColor;
            [self setTitleColor:_borderColor forState:UIControlStateNormal];
        }
    }
}

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

- (void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor;
}

- (void)dealloc{
    if (self.borderColor) {
        self.borderColor = nil;
    }
    if (self.selectColor) {
        self.selectColor = nil;
    }
}
@end
