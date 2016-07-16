//
//  AAIBButton.h
//  SXYZProject
//
//  Created by shiyuan on 16/7/14.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface AAIBButton : UIButton
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
@property (nonatomic, assign)IBInspectable UIColor *borderColor;
@end
