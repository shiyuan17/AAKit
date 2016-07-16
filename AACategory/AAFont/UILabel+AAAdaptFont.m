//
//  UILabel+ZJZCAdaptFont.m
//  ZJZCProject
//
//  Created by A on 16/5/19.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "UILabel+AAAdaptFont.h"
#import <objc/runtime.h>
#import "AAKitHeader.h"
@implementation UILabel (AAAdaptFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        if(self.tag != AA_NoFontAdapt){
            self.adjustsFontSizeToFitWidth = YES;
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont systemFontOfSize:AA_AdaptsScaleY(fontSize)];
        }
    }
    return self;
}

@end
