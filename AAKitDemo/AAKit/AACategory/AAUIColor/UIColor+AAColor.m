//
//  UIColor+AAColor.m
//  AAKitDemo
//
//  Created by shiyuan on 16/9/30.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import "UIColor+AAColor.h"


CGFloat aa_colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@implementation UIColor (AAColor)
+ (UIColor *)aa_colorWithHexString:(NSString *)hexString {
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = aa_colorComponentFrom(colorString, 0, 1);
            green = aa_colorComponentFrom(colorString, 1, 1);
            blue  = aa_colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = aa_colorComponentFrom(colorString, 0, 1);
            red   = aa_colorComponentFrom(colorString, 1, 1);
            green = aa_colorComponentFrom(colorString, 2, 1);
            blue  = aa_colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = aa_colorComponentFrom(colorString, 0, 2);
            green = aa_colorComponentFrom(colorString, 2, 2);
            blue  = aa_colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = aa_colorComponentFrom(colorString, 0, 2);
            red   = aa_colorComponentFrom(colorString, 2, 2);
            green = aa_colorComponentFrom(colorString, 4, 2);
            blue  = aa_colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)aa_randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

- (NSString *)aa_HEXString{
    UIColor* color = self;
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}
@end
