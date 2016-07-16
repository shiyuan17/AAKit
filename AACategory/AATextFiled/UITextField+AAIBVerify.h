//
//  UITextField+AAIBVerify.h
//  AAKitDemo
//
//  Created by shiyuan on 16/7/16.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface UITextField (AAIBVerify)

@property (nonatomic,strong) IBInspectable NSString *verifyType;/**<验证类型*/
@property (nonatomic,strong) IBInspectable NSString *errorMessage;/**<错误消息*/
@property (nonatomic,strong) IBInspectable NSString *errorDisplay;/**<错误提示方式(默认hud,其它则为自定义)*/


@end
