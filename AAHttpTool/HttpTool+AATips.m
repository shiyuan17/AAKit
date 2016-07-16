//
//  HttpTool+Tips.m
//  BestPracticesProject
//
//  Created by 世缘 on 16/6/15.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "HttpTool+AATips.h"
#import "AAHudTool.h"
#import "AAHttpToolMappingModel.h"

@implementation AAHttpTool (Tips)
+ (void)autoTipsWithGetURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate{
    [self requestHandle];
    NSLog(@"url:%@",url);
    [AAHttpTool getWithURL:url params:params mappingModel:mappingModel complate:^(AAHttpToolMappingModel *result) {
        [self resultHandle:result complate:complate];
    }];
}

+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate{
    [self requestHandle];
    [AAHttpTool postWithURL:url params:params mappingModel:mappingModel complate:^(AAHttpToolMappingModel *result) {
        [self resultHandle:result complate:complate];
    }];
}

+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate{
    [self requestHandle];
    [AAHttpTool postWithURL:url params:params formDataArray:formDataArray mappingModel:mappingModel complate:^(AAHttpToolMappingModel *result) {
        [self resultHandle:result complate:complate];
    }];
}

+ (void)autoTipsWithPutURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate{
    [self requestHandle];
    [AAHttpTool putWithURL:url params:params mappingModel:mappingModel complate:^(AAHttpToolMappingModel *result) {
        [self resultHandle:result complate:complate];
    }];
}

+ (void)autoTipsWithDeleteURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate{
    [self requestHandle];
    [AAHttpTool deleteWithURL:url params:params mappingModel:mappingModel complate:^(AAHttpToolMappingModel *result) {
        [self resultHandle:result complate:complate];
    }];
}

+ (void)requestHandle{
    [[AAHudTool sharedManager] showLoadingWithText:@"加载中"];
}

+ (void)resultHandle:(AAHttpToolMappingModel *)result complate:(void (^)(AAHttpToolMappingModel *))complate{
    if (result.code != HttpCodeTypeSuccess) {
        [[AAHudTool sharedManager] hideHudWithText:result.errorMessage complete:nil];
    }else{
        if (complate) {
            [[AAHudTool sharedManager] hideHud];
            complate(result);
        }
    }
}
@end
