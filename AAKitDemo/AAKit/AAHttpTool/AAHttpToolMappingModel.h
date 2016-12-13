//
//  HttpToolMappingModel.h
//  ZJZCProject
//
//  Created by 世缘 on 16/6/14.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, HttpCodeType) {
    HttpCodeTypeSuccess=200,/**<请求成功*/
    HttpCodeTypeGrammarError=400,/**<服务器成功处理了请求，但不需要返回任何实体内容*/
    HttpCodeTypeNotFound=404,/**<地址不存在*/
    HttpCodeTypeServiceError=500,/**<服务器错误*/
    HttpCodeTypeRequestTimeOut = -1001,/**<请求超时*/
    HttpCodeTypeNoNetwork=-1000,/**<没有网络*/
    HttpCodeTypeOther=-2000/**<网络异常错误*/
};
@interface AAHttpToolMappingModel : NSObject
@property (nonatomic,strong) NSError *error;/**<状态非200错误*/
@property (nonatomic,assign) HttpCodeType code;/**<请求状态码*/
@property (nonatomic,strong) NSString *errorMessage;/**<错误消息*/
@property (nonatomic,strong) id mappingModel;/**<映射好的实体*/
@property (nonatomic,strong) id responseData;
@property (nonatomic,assign,getter=isMappingFlag) BOOL mappingFlag;/**<实体是否映射成功*/

+ (instancetype)initModelWithCode:(HttpCodeType)code;
+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code;
+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code msg:(NSString *)errorMesssage;
+ (instancetype)initModelWithError:(NSError *)error code:(HttpCodeType)code mappingModel:(id)mappingModel;
+ (instancetype)initModelWithMappingModel:(id)mappingModel;


/**
 *  根据返回的data进行映射
 *
 *  @param responseObject 返回的数据
 *  @param mappingModel   要映射成的实体对象
 *
 */
- (instancetype)initMappingModelWithResponseObject:(id)responseObject mappingModel:(Class)mappingModel;
@end
