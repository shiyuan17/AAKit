//
//  AAHttpToolCache.m
//  SXYZProject
//
//  Created by shiyuan on 16/8/18.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAHttpToolCache.h"
#import "NSString+AAPassword.h"
#import "NSDictionary+AACategory.h"
#import "PINCache.h"
#import <UIKit/UIKit.h>
static dispatch_source_t _timer;

@implementation AAHttpToolCache

NSString *const HttpCacheArrayKey = @"HttpCacheArrayKey";/**<存储所有缓存的key*/
NSString *const HttpExpiredCacheArrayKey = @"HttpExpiredCacheArrayKey";/**<存储过期缓存的key*/
NSString *const HttpPasswordKey = @"GUIDKey";/**<密钥key*/

#pragma mark - 加密/解密 缓存数据
#pragma mark 获取对象解密key
+ (NSString *) getObjectDecryptionKey{

    NSString *tmpStr = [[PINCache sharedCache] objectForKey:HttpPasswordKey];
    if (NSStringIsNullOrEmpty(tmpStr)) {
        NSString *guid = [NSString aa_base64StringFromText:[NSString aa_stringWithGUID]];
        tmpStr = guid;
        [[PINCache sharedCache] setObject:guid forKey:HttpPasswordKey];
//        [USER_DEFAULT synchronize];
    }
    return tmpStr;
}

#pragma mark 加密保存缓存对象
+ (void)saveCacheObj:(id)obj key:(NSString *)key expired:(HttpCacheExpiredTimeType)expiredType{
    if (expiredType == HttpCacheExpiredTimeTypeApplication) {
        [[PINMemoryCache sharedCache] setObject:obj forKey:key];
    }else{
        [[PINCache sharedCache] setObject:obj forKey:key];
    }
}

#pragma mark 解密取出来的缓存对象
+ (id)getCacheObj:(NSString *)key  expired:(HttpCacheExpiredTimeType)expiredType{
    NSString *objStr = @"";
    if (expiredType == HttpCacheExpiredTimeTypeApplication) {
         objStr = [[PINMemoryCache sharedCache] objectForKey:key];
    }else{
        objStr = [[PINCache sharedCache] objectForKey:key];
    }
    return objStr;
}

#pragma mark - 缓存
#pragma mark 保存http缓存对象
+ (void)saveHttpCacheObjectWithUrl:(NSString *)url param:(NSDictionary *)param expired:(HttpCacheExpiredTimeType)expiredType obj:(id)obj{
    NSString *md5CacheKey = [self getHttpCacheKeyWithUrl:url param:param];
    
    [self saveCacheObj:obj key:md5CacheKey expired:expiredType];
    
    if (expiredType == HttpCacheExpiredTimeTypeNormal) {
        [self saveHttpCacheArrayWithKey:md5CacheKey];//保存cacheKey
    }else{
        [self saveHttpExpiredCacheArrayWithKey:md5CacheKey expired:expiredType];//保存定时缓存 CacheKey
        
    }
    
}

#pragma mark 获取缓存key
+ (NSString *)getHttpCacheKeyWithUrl:(NSString *)url param:(NSDictionary *)param{
    NSString *paramStr = [param aa_dictionaryToJson];
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@%@",url,paramStr,@"cacheKey"];
    NSString *trimText = [cacheKey stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    NSString *md5CacheKey = [trimText MD5Digest];
    return md5CacheKey;
}


#pragma mark 保存http缓存对应的key 数组
+ (void)saveHttpCacheArrayWithKey:(NSString *)key{
    NSMutableDictionary *cacheDic = [[PINCache sharedCache] objectForKey:HttpCacheArrayKey];
    if (!cacheDic) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:key forKey:key];
        
        [[PINCache sharedCache] setObject:dic forKey:HttpCacheArrayKey];
//        [USER_DEFAULT synchronize];
    }else{
        id obj = [cacheDic objectForKey:key];
        if (!obj) {
            [cacheDic setObject:key forKey:key];
            [[PINCache sharedCache] setObject:cacheDic forKey:HttpCacheArrayKey];
//            [USER_DEFAULT synchronize];
        }
        
    }
    
    
}

#pragma mark 保存http过期缓存对应的key 数组
+ (void)saveHttpExpiredCacheArrayWithKey:(NSString *)key expired:(HttpCacheExpiredTimeType)expiredType{
    NSMutableDictionary *cacheDic = [[PINCache sharedCache] objectForKey:HttpExpiredCacheArrayKey];
    
    NSString *cacheKeyDate = [NSString stringWithFormat:@"%@,%ld",[[self getDateFormatter] stringFromDate:[NSDate date]],(long)expiredType];
    if (!cacheDic) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:cacheKeyDate forKey:key];
        
        [[PINCache sharedCache] setObject:dic forKey:HttpExpiredCacheArrayKey];
//        [USER_DEFAULT synchronize];
        
    }else{
        id obj = [cacheDic objectForKey:key];
        if (!obj) {//判断是否已经保存了对应的key
            [cacheDic setObject:cacheKeyDate forKey:key];
            [[PINCache sharedCache] setObject:cacheDic forKey:HttpExpiredCacheArrayKey];
//            [USER_DEFAULT synchronize];
        }
        
    }
    
}

#pragma mark 清除本地http缓存
+ (void)clearAllLocalHttpCache:(clearHttpCacheBlock)block{
    NSArray *arrs = (NSArray *)[[PINCache sharedCache] objectForKey:HttpCacheArrayKey];
    for (NSString *key in arrs) {
        [[PINCache sharedCache] removeObjectForKey:key];
    }
    [[PINCache sharedCache] removeObjectForKey:HttpCacheArrayKey];
    
    block();
}
//TODO:PINMemoryCache 先是应用缓存，后改时间
#pragma mark 清除所有http本地时间缓存
+ (void)clearAllLocalHttpTimeCache:(clearHttpExpiredCacheBlock)block{
    NSArray *arrs = (NSArray *)[[PINCache sharedCache] objectForKey:HttpExpiredCacheArrayKey];
    for (NSString *key in arrs) {
        [[PINCache sharedCache] removeObjectForKey:key];
    }
    [[PINCache sharedCache] removeObjectForKey:HttpExpiredCacheArrayKey];
    
    block();
}

#pragma mark 定时查询过期缓存，过期则清除
+ (void)regularlyCheckExpiredHttpCache{
    
    NSTimeInterval period = 60.0;/**一分钟检查一次*/
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_timer, ^{
        
        NSDictionary *cacheDic = [[PINCache sharedCache] objectForKey:HttpExpiredCacheArrayKey];
        NSMutableDictionary *tmpDic = [NSMutableDictionary dictionaryWithDictionary:cacheDic];
        BOOL isEdit = NO;
        for (NSString *key in [cacheDic allKeys]) {
            NSString *value = [cacheDic objectForKey:key];
            NSArray *arr = [value componentsSeparatedByString:@","];
            if (arr.count>1) {
                NSDateFormatter *formatter = [self getDateFormatter];
                
                NSString *oldDateStr = arr[0];
                NSDate *oldDate = [formatter dateFromString:oldDateStr];
                CGFloat time = [arr[1] floatValue];
                
                NSString *currentDateStr = [formatter stringFromDate:[NSDate date]] ;
                NSDate *currentDate = [formatter dateFromString:currentDateStr];
                
                NSTimeInterval aTimer = [currentDate timeIntervalSinceDate:oldDate];
                int hour = (int)(aTimer/3600);
                int minute = (int)(aTimer - hour*3600)/60;
                //                int second = aTimer - hour*3600 - minute*60;
                if (minute>=time) {
                    isEdit = YES;
                    [[PINCache sharedCache] removeObjectForKey:key];
                    [tmpDic removeObjectForKey:key];
                }
            }
        }
        
        if (isEdit) {
            [[PINCache sharedCache] setObject:tmpDic forKey:HttpExpiredCacheArrayKey];
//            [USER_DEFAULT synchronize];
        }
    });
    
    dispatch_resume(_timer);
}

#pragma mark - 日期对象获取
+ (NSDateFormatter *)getDateFormatter
{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        formatter  = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    return formatter;
}
@end
