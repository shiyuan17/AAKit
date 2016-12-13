//
//  NSString+MD5.h
//  Tmp
//
//  Created by A on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AAPassword)
- (NSString *)MD5Digest;/**<32位MD5*/


//Base64
+ (NSString *)aa_base64StringFromText:(NSString *)text;/**<转base64*/
+ (NSString *)aa_base64EncodedStringFrom:(NSData *)data;/**<data转base64*/
+ (NSString *)aa_textFromBase64String:(NSString *)base64;/**<文本转base64*/

+(NSString *)aa_DESEncryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes;/**<DES加密*/

+(NSString *)aa_DESDecryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;/**<DES解密*/

+ (NSData *)aa_AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;/**<AES加密*/

+ (NSData *)aa_AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;/**<AES解密*/

+ (NSString*) aa_stringWithGUID;/**<生成GUID*/
@end
