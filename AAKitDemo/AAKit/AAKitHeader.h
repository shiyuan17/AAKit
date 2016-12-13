//
//  AAKitHeader.h
//  SXYZProject
//
//  Created by A on 16/6/30.
//  Copyright © 2016年 BoShang. All rights reserved.
//
//屏幕宽
#define AA_SCREEN_BOUNDS_WIDTH [[UIScreen mainScreen] bounds].size.width

//屏幕高
#define AA_SCREEN_BOUNDS_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define AA_NoFontAdapt 3333
#define AA_AdaptsScaleY(stance) (((float)stance / 568) * AA_SCREEN_BOUNDS_HEIGHT)

#import "AAHttpTool.h"
#import "AAHudTool.h"
