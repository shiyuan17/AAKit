//
//  LoadingTool.h
//  ZJZCProject
//
//  Created by A on 16/6/15.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAHudTool : NSObject
- (void)showLoadingWithText:(NSString *)text;/**<加载中文本提示消息*/

- (void)showMessageWithText:(NSString *)text;/**<普通文本提示消息*/

- (void)hideHud;/**<隐藏提示*/

- (void)hideHudWithText:(NSString *)text complete:(void (^)())complete;/**<提示后隐藏*/

+ (AAHudTool *)sharedManager;
@end
