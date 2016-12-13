//
//  LoadingTool.h
//  ZJZCProject
//
//  Created by A on 16/6/15.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AAHudTool : NSObject
@property (nonatomic,assign) BOOL isTransparent;/**<是否透明*/

- (void)aa_showLoadingWithText:(NSString *)text;/**<加载中文本提示消息*/

- (void)aa_showMessageWithText:(NSString *)text;/**<普通文本提示消息*/

- (void)aa_showProgressWithText:(NSString *)text;/**<进度信息*/

- (void)aa_setHudProgress:(CGFloat)progress;

- (void)aa_hideHud;/**<隐藏提示*/

- (void)aa_hideHudWithText:(NSString *)text complete:(void (^)())complete;/**<提示后隐藏*/

+ (void)aa_hudSquare:(BOOL)square;

+ (AAHudTool *)sharedManager;
@end
