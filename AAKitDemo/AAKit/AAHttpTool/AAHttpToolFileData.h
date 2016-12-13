//
//  HttpToolFileData.h
//  BestPracticesProject
//  请求的文件实体
//  Created by 世缘 on 16/6/16.
//  Copyright © 2016年 sy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAHttpToolFileData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  请求参数key
 */
@property (nonatomic, copy) NSString *keyName;

/**
 *  文件名 必须加后缀
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;

- (instancetype) initWithData:(NSData *)data keyName:(NSString *)keyName fileName:(NSString *)fileName mimeType:(NSString *)mimeType;
@end
