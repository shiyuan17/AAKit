//
//  AAIBTextField.m
//  SXYZProject
//
//  Created by shiyuan on 16/7/15.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAIBTextField.h"
@interface AAIBTextField()<UITextFieldDelegate>

@end

IB_DESIGNABLE
@implementation AAIBTextField
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.delegate  = self;
        _showKeyBord = YES;
    }
    return self;
    
}

- (instancetype)init {
    if (self = [super init]) {
        self.delegate  = self;
        _showKeyBord = YES;
    }
    return self;
}

- (void)setTextLeftDistance:(CGFloat )textLeftDistance {
    
    _textLeftDistance = textLeftDistance;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textLeftDistance, 1)];
    self.leftViewMode = UITextFieldViewModeAlways;
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

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
}

- (void)setSelectBorderColor:(UIColor *)selectBorderColor{
    _selectBorderColor = selectBorderColor;
}

- (void)setShowKeyBord:(BOOL)showKeyBord{
    _showKeyBord = showKeyBord;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (_selectBorderColor) {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionOverrideInheritedDuration
                         animations:^{
                             self.layer.borderColor = _selectBorderColor.CGColor;
                         }
                         completion:nil];
    }
    if (self.textFieldClick) {
        self.textFieldClick();
    }
    return _showKeyBord;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (_selectBorderColor) {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionOverrideInheritedDuration
                         animations:^{
                             self.layer.borderColor = _borderColor.CGColor;
                         }
                         completion:nil];
    }
    
}

- (void)dealloc{
    if (self.borderColor) {
        self.borderColor = nil;
    }
    if (self.selectBorderColor) {
        self.selectBorderColor = nil;
    }
}
@end
