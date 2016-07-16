//
//  LoadingTool.m
//  ZJZCProject
//
//  Created by A on 16/6/15.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "AAHudTool.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

static MBProgressHUD *hudTmp;
static CGFloat delay = 1.7f;

@implementation AAHudTool
#pragma mark - 显示加载文本

- (void)showLoadingWithText:(NSString *)text{
    [self setupCommonConfig:[self getHud] text:text];
}

#pragma mark - 提示消息
- (void)showMessageWithText:(NSString *)text{
    [self hideHud];
    MBProgressHUD *hud = [self getHud];
    
    [self setupCommonConfig:hud text:text];
    hud.mode = MBProgressHUDModeText;
    hud.square = NO;
    //    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);//显示在底部
    
    [hud hideAnimated:YES afterDelay:delay];
}

#pragma mark - 隐藏
- (void)hideHud{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hudTmp hideAnimated:YES];
        });

    }else{
        [hudTmp hideAnimated:YES];
    }
    
}

#pragma mark - 隐藏前提示
- (void)hideHudWithText:(NSString *)text complete:(void (^)())complete{
    hudTmp.label.text = text;
    hudTmp.mode = MBProgressHUDModeText;
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [hudTmp hideAnimated:YES];
        if (complete) {
            complete();
        }
    });
}

#pragma mark - 配置公共用法
- (void)setupCommonConfig:(MBProgressHUD *)hud text:(NSString *)text{
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = [UIColor blackColor];
    hud.bezelView.layer.cornerRadius = 10;
    hud.square = YES;
    hud.bezelView.layer.masksToBounds = YES;
    hud.label.text = text;
    hud.userInteractionEnabled = YES;//设置是否允许用户操作 YES禁用用户操作 NO允许
}

- (MBProgressHUD *)getHud{
    UIWindow *window = [self lastWindow];
    hudTmp = [MBProgressHUD showHUDAddedTo:window animated:YES];
    return hudTmp;
}

- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

+ (AAHudTool *)sharedManager
{
    static AAHudTool *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance  = [[self alloc] init];
    });
    return instance;
}
@end
