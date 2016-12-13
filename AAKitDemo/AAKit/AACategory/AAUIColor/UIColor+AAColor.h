//
//  UIColor+AAColor.h
//  AAKitDemo
//
//  Created by shiyuan on 16/9/30.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AAColor)

+ (UIColor *)aa_colorWithHexString:(NSString *)hexString;/**<16进制颜色转换*/

+ (UIColor *)aa_randomColor;/**<生成随机颜色*/

- (NSString *)aa_HEXString;/**<返回16进制颜色*/
@end
