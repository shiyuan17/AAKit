//
//  HttpTool.h
//  DotaMaster
//  请求工具类
//  Created by 世缘 on 15/4/9.
//  Copyright (c) 2015年 Qian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAHttpToolMappingModel.h"
#import "AAHttpToolRequestModel.h"
@interface AAHttpTool : NSObject


typedef NS_ENUM(NSInteger, HttpErrorType) {
    HttpErrorTypeNormal=0,//请求正常，无错误
    
    HttpErrorTypeURLConnectionError,//请求时出错，可能是URL不正确
    
    HttpErrorTypeStatusCodeError,//请求时出错，服务器未返回正常的状态码：200
    
    HttpErrorTypeDataNilError,//请求回的Data在解析前就是nil，导致请求无效，无法后续JSON反序列化。
    
    HttpErrorTypeDataSerializationError,//data在JSON反序列化时出错
    
    HttpErrorTypeNoNetWork,//无网络连接
    
    HttpErrorTypeServiceRetrunErrorStatus,//服务器请求成功，但抛出错误
};


//单位分钟
typedef NS_ENUM(NSInteger, HttpCacheExpiredTimeType) {
    HttpCacheExpiredTimeTypeNormal=0,/**<不设置过期时间*/
    HttpCacheExpiredTimeTypeThirtyMinutes=30,/**<30分钟*/
    HttpCacheExpiredTimeTypeOneDay=1440,/**<一天*/
    HttpCacheExpiredTimeTypeTwoDay=2880/**<两天*/
};


typedef void (^successBlock)(id obj);

typedef void (^errorBlock)(HttpErrorType errorType);
typedef void (^failureBlocks)(NSError *error);
typedef void (^clearHttpCacheBlock)();
typedef void (^clearHttpExpiredCacheBlock)();

+ (void)request:(AAHttpToolRequestModel *)requestModel complate:(void (^)(AAHttpToolMappingModel *))complate;

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;


/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formData  文件参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;;


/**
 *  发送一个PUT请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)putWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;

/**
 *  发送一个Delete请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param mappingModel  要映射的实体
 *  @param complate 请求处理回调
 */
+ (void)deleteWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;

+ (void)clearAllLocalHttpCache:(clearHttpCacheBlock)block;/**<清除所有本地http缓存*/
+ (void)clearAllLocalHttpTimeCache:(clearHttpExpiredCacheBlock)block;/**<清除所有http时间缓存*/

@end
