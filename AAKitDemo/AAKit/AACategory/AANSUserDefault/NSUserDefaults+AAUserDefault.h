//
//  NSUserDefaults+AAUserDefault.h
//  SXYZProject
//
//  Created by shiyuan on 16/7/31.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (AAUserDefault)
+ (NSString *)aa_stringForKey:(NSString *)defaultName;

+ (NSArray *)aa_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)aa_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)aa_dataForKey:(NSString *)defaultName;

+ (NSArray *)aa_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)aa_integerForKey:(NSString *)defaultName;

+ (float)aa_floatForKey:(NSString *)defaultName;

+ (double)aa_doubleForKey:(NSString *)defaultName;

+ (BOOL)aa_boolForKey:(NSString *)defaultName;

+ (NSURL *)aa_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)aa_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)aa_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)aa_setArcObject:(id)value forKey:(NSString *)defaultName;
@end
