//
//  TestRequestModel.h
//  AAKitDemo
//
//  Created by shiyuan on 16/12/10.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TestRequestModelData;
@interface TestRequestModel : NSObject
@property (nonatomic,assign) NSInteger errcode;
@property (nonatomic,copy) NSString *errmsg;
@property (nonatomic,strong) NSArray <TestRequestModelData *> *data;
@end

@interface TestRequestModelData : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *subName;
@property (nonatomic,copy) NSString *imgUrl;
@end



