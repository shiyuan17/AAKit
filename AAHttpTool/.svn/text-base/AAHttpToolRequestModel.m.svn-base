//
//  HttpToolRequestModel.m
//  BestPracticesProject
//
//  Created by 世缘 on 16/6/16.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "AAHttpToolRequestModel.h"

@implementation AAHttpToolRequestModel
//默认初始化，请求类型post,没有请求参数，不缓存，不提示
+ (instancetype)init{
    AAHttpToolRequestModel *model = [[AAHttpToolRequestModel alloc] init];
    model.url = @"";
    model.params = nil;
    model.requestType = HttpRequestTypePost;
    model.cacheType = HttpCacheTypeNormal;
    model.tips = NO;
    model.tipsText = @"数据加载中";
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url mappingModel:(Class)mappingModel{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.mappingModel = mappingModel;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param mappingModel:(Class)mappingModel{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.mappingModel = mappingModel;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.files = files;
    model.mappingModel = mappingModel;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel tips:(BOOL)tips{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.files = files;
    model.mappingModel = mappingModel;
    model.tips = tips;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel tipsText:(NSString *)tipsText{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.files = files;
    model.mappingModel = mappingModel;
    model.tips = YES;
    model.tipsText = tipsText;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType mappingModel:(Class)mappingModel{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.requestType = requestType;
    model.mappingModel = mappingModel;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType mappingModel:(Class)mappingModel tips:(BOOL)tips{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.requestType = requestType;
    model.mappingModel = mappingModel;
    model.tips = tips;
    return model;
}

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType cacheType:(HttpCacheType)cacheType mappingModel:(Class)mappingModel tips:(BOOL)tips{
    AAHttpToolRequestModel *model = [self init];
    model.url = url;
    model.params = param;
    model.requestType = requestType;
    model.cacheType = cacheType;
    model.mappingModel = mappingModel;
    model.tips = tips;
    return model;
}
@end
