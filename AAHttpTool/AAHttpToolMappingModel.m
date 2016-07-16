//
//  HttpToolMappingModel.m
//  ZJZCProject
//
//  Created by 世缘 on 16/6/14.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAHttpToolMappingModel.h"
#import "NSDictionary+AACategory.h"

@implementation AAHttpToolMappingModel

+ (instancetype)initModelWithCode:(HttpCodeType)code{
    AAHttpToolMappingModel *model = [[self alloc] init];
    model.code = code;
    model.errorMessage = @"";
    return model;
}

+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code{
    AAHttpToolMappingModel *model = [[self alloc] init];
    model.code = code;
    model.error = error;
    return model;
}

+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code mappingModel:(id)mappingModel{
    AAHttpToolMappingModel *model = [[self alloc] init];
    model.error = error;
    model.code = code;
    model.mappingModel = mappingModel;
    return model;
}

+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code msg:(NSString *)errorMesssage{
    AAHttpToolMappingModel *model = [[self alloc] init];
    model.error = error;
    model.code = code;
    model.errorMessage = errorMesssage;
    return model;
}

+ (instancetype)initModelWithMappingModel:(id)mappingModel{
    AAHttpToolMappingModel *model = [[self alloc] init];
    model.mappingModel = mappingModel;
    return model;
}

- (instancetype)initMappingModelWithResponseObject:(id)responseObject mappingModel:(Class)mappingModel{
    if (self = [super init]) {
        self.code = HttpCodeTypeSuccess;
        
        NSObject *resultMapping = [[NSObject alloc] init];
        if (responseObject != nil && responseObject != [NSNull null] && mappingModel != nil) {
            NSString *resultText = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
            NSDictionary *resultDic = [NSDictionary dictionaryWithJsonString:resultText];
            if ([resultDic isKindOfClass:[NSDictionary class]]) {
                if ([mappingModel respondsToSelector:@selector(mj_objectWithKeyValues:)]) {
                    resultMapping = [mappingModel performSelector:@selector(mj_objectWithKeyValues:) withObject:responseObject];
                    self.mappingFlag = YES;
                }
            }
            
        }else{
            resultMapping = responseObject;
            self.mappingFlag = NO;
        }
        self.mappingModel = resultMapping;
    }
    return self;
}
@end
