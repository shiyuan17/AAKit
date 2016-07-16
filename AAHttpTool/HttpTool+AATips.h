//
//  HttpTool+Tips.h
//  BestPracticesProject
//
//  Created by 世缘 on 16/6/15.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "AAHttpTool.h"

@interface AAHttpTool (AATips)
/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)autoTipsWithGetURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;


/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formData  文件参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;


/**
 *  发送一个PUT请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)autoTipsWithPutURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;

/**
 *  发送一个Delete请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)autoTipsWithDeleteURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;
@end
