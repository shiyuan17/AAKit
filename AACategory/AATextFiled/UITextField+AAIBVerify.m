//
//  UITextField+AAIBVerify.m
//  AAKitDemo
//
//  Created by shiyuan on 16/7/16.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import "UITextField+AAIBVerify.h"
#import <objc/runtime.h>

@implementation UITextField (AAIBVerify)
- (void)setVerifyType:(NSString *)verifyType{
     objc_setAssociatedObject(self, @selector(verifyType), verifyType,OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)verifyType{
      return objc_getAssociatedObject(self, @selector(verifyType));
}
@end
