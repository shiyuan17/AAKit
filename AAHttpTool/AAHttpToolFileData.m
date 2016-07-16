//
//  HttpToolFileData.m
//  BestPracticesProject
//
//  Created by 世缘 on 16/6/16.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "AAHttpToolFileData.h"

@implementation AAHttpToolFileData
- (instancetype)initWithData:(NSData *)data keyName:(NSString *)keyName fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    if (self = [super init]) {
        self.data = data;
        self.keyName = keyName;
        self.filename = fileName;
        self.mimeType = mimeType;
    }
    return self;
}
@end
