//
//  ViewController.m
//  AAKitDemo
//
//  Created by shiyuan on 16/9/24.
//  Copyright © 2016年 shiyuan. All rights reserved.
//

#import "ViewController.h"
#import "AAMockData.h"
#import "TestModel.h"
#import "MJExtension.h"

#import "AAKit/AAKitHeader.h"
#import "TestRequestModel.h"
#import "AAHudTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)postTest:(UIButton *)sender {

    //url:请求地址
    //params请求传递的参数
    //mappingModel要映射的实体
    //AAHttpToolMappingModel 返回的实体，code映射状态，errorMessage错误消息、mappingModel已经映射生成好的实体
    [[AAHudTool sharedManager] aa_showLoadingWithText:@"数据加载中..."];
    
    [AAHttpTool getWithURL:@"http://bugfix-10032430.cos.myqcloud.com/getTest.json" params:nil mappingModel:[TestRequestModel class] complate:^(AAHttpToolMappingModel *result) {
        [[AAHudTool sharedManager] aa_hideHud];
        
        TestRequestModel *model = result.mappingModel;
        NSLog(@"errmsg:%@",model.errmsg);
        NSLog(@"model：%@",model.mj_keyValues);
    }];

}

@end
