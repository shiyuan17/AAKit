//
//  HttpToolRequestModel.h
//  BestPracticesProject
//  请求实体
//  Created by 世缘 on 16/6/16.
//  Copyright © 2016年 sy. All rights reserved.
//
#import "AAHttpToolFileData.h"
#import <Foundation/Foundation.h>
//请求类型
typedef NS_ENUM(NSInteger, HttpRequestType) {
    HttpRequestTypeGet=0,
    HttpRequestTypePost,
    HttpRequestTypePut,
    HttpRequestTypeDelete
};

//缓存类型
typedef NS_ENUM(NSInteger, HttpCacheType) {
    HttpCacheTypeNormal=0,//普通请求不缓存数据
    HttpCacheTypeUrl,//系统Url缓存
    HttpCacheTypeCustomerRequest//请求并使用缓存(有缓存就使用缓存不发起请求)
};

@interface AAHttpToolRequestModel : NSObject
@property (nonatomic, strong) NSString                          *url;/**<请求地址*/
@property (nonatomic, assign) HttpRequestType                   requestType;/**<请求类型*/
@property (nonatomic, assign) NSDictionary                      *params;/**<请求参数*/
@property (nonatomic, strong) NSArray<AAHttpToolFileData *>       *files;/**<上传的文件数组（存储的是HttpToolFileData实体）*/
@property (nonatomic, assign) HttpCacheType                     cacheType;/**<缓存类型*/
@property (nonatomic, strong) Class                             mappingModel;/**<要映射的实体类*/
@property (nonatomic, assign,getter=isTips) BOOL                tips;/**<是否显示提示 加载中，加载完成，加载异常等提示*/
@property (nonatomic, strong) NSString                          *tipsText;/**<提示文本*/

+ (instancetype)initWithUrl:(NSString *)url mappingModel:(Class)mappingModel;/**<设置映射的实体：默认以post请求，不缓存，不提示*/

/**
 *  初始化构造
 *
 *  @param url          请求链接地址
 *  @param param        请求参数
 *  @param mappingModel 映射实体
 *
 *  @return 请求参数实体
 */
+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param mappingModel:(Class)mappingModel;

/**
 *  初始化构造
 *
 *  @default            默认不缓存，不提示
 *  @param url          请求链接地址
 *  @param param        请求参数
 *  @param requestType  请求类型
 *  @param mappingModel 要映射的实体class
 *
 *  @return 请求参数实体
 */
+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType mappingModel:(Class)mappingModel;

/**
 *  初始化构造
 *
 *  @default            默认不缓存，不提示
 *  @param url          请求链接地址
 *  @param param        请求参数
 *  @param files        文件数组
 *  @param mappingModel 要映射的实体class
 *
 *  @return 请求参数实体
 */
+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel;

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel tips:(BOOL)tips;

+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param files:(NSArray *)files mappingModel:(Class)mappingModel tipsText:(NSString *)tipsText;

/**
 *  初始化构造
 *
 *  @default 默认不缓存
 *  @param url          请求链接地址
 *  @param requestType  请求类型
 *  @param mappingModel 要映射的实体class
 *  @param tips         是否显示提示
 *
 *  @return 请求参数实体
 */
+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType mappingModel:(Class)mappingModel tips:(BOOL)tips;

/**
 *  初始化构造
 *
 *  @param url          请求链接地址
 *  @param requestType  请求类型
 *  @param cacheType    缓存类型
 *  @param mappingModel 要映射的实体class
 *  @param tips         是否显示提示
 *
 *  @return 请求参数实体
 */
+ (instancetype)initWithUrl:(NSString *)url param:(NSDictionary *)param requestType:(HttpRequestType) requestType cacheType:(HttpCacheType)cacheType mappingModel:(Class)mappingModel tips:(BOOL)tips;

@end
