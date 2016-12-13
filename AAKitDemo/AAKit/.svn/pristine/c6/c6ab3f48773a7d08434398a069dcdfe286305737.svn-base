//
//  UIButton+ClickRect.m
//  ZJZCProject
//
//  Created by A on 16/6/22.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "UIButton+AAClickRect.h"

@implementation UIButton (AAClickRect)
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}
@end
