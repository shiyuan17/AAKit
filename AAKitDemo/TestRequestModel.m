//
//  TestRequestModel.m
//  AAKitDemo
//
//  Created by shiyuan on 16/12/10.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import "TestRequestModel.h"

@implementation TestRequestModel
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [TestRequestModelData class]};
}
@end

@implementation TestRequestModelData

@end


