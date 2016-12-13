//
//  AAHttpToolCache.h
//  SXYZProject
//
//  Created by shiyuan on 16/8/18.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <Foundation/Foundation.h>


//单位分钟
typedef NS_ENUM(NSInteger, HttpCacheExpiredTimeType) {
    HttpCacheExpiredTimeTypeNormal=0,/**<永久*/
    HttpCacheExpiredTimeTypeThirtyMinutes=30,/**<30分钟*/
    HttpCacheExpiredTimeTypeOneDay=1440,/**<一天*/
    HttpCacheExpiredTimeTypeTwoDay=2880,/**<两天*/
    HttpCacheExpiredTimeTypeApplication=-9999/**<应用程序期间*/
};

typedef void (^clearHttpCacheBlock)();
typedef void (^clearHttpExpiredCacheBlock)();

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define NSStringIsNullOrEmpty(string) ({NSString *str=(string);(str==nil || [str isEqual:[NSNull null]] ||  str.length == 0 || [str isKindOfClass:[NSNull class]] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])?YES:NO;})

@interface AAHttpToolCache : NSObject
+ (void)saveCacheObj:(id)obj key:(NSString *)key expired:(HttpCacheExpiredTimeType)expiredType;/**<加密保存缓存对象*/
+ (void)saveHttpCacheObjectWithUrl:(NSString *)url param:(NSDictionary *)param expired:(HttpCacheExpiredTimeType)expiredType obj:(id)obj;
+ (id)getCacheObj:(NSString *)key  expired:(HttpCacheExpiredTimeType)expiredType;/**<获取解密出来的缓存对象*/
+ (NSString *)getHttpCacheKeyWithUrl:(NSString *)url param:(NSDictionary *)param;/**<获取缓存key*/
+ (void)regularlyCheckExpiredHttpCache;/**<定时清除过期数据*/

+ (void)clearAllLocalHttpCache:(clearHttpCacheBlock)block;/**<清除所有本地http缓存*/
+ (void)clearAllLocalHttpTimeCache:(clearHttpExpiredCacheBlock)block;/**<清除所有http时间缓存*/
@end
