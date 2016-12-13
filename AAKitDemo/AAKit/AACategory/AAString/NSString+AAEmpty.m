//
//  NSString+AAEmpty.m
//  AAKitDemo
//
//  Created by shiyuan on 16/10/6.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import "NSString+AAEmpty.h"

@implementation NSString (AAEmpty)
- (BOOL)isEmpty{
    NSString *str=self;
    BOOL flag =  (str==nil || [str isEqual:[NSNull null]] ||  str.length == 0 || [str isKindOfClass:[NSNull class]] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])?YES:NO;
    return flag;
}
@end
