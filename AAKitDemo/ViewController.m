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

#import "UIViewController+AAPageRefresh.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbv;
@property (strong,nonatomic) NSMutableArray *arrays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrays = [[NSMutableArray alloc] init];
    
    //1.添加刷新
    __weak __typeof(&*self) weakSelf = self;
    [self aa_addPageRefreshWithTabelView:_tbv data:self.arrays loadData:^{
        //处理刷新逻辑
        [weakSelf loadPageData];
    }];
    
    [self loadPageData];
    
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

//加载page数据
- (void)loadPageData{
    
    NSLog(@"aa:%@",self.aa_currentPage);
    NSDictionary *dic = @{@"memberId":@"1",@"type":@"1",@"page":self.aa_currentPage};
     __weak __typeof(&*self) weakSelf = self;
    [AAHttpTool getWithURL:@"http://www.zctx919.com/servlet/GetOrderByType" params:dic mappingModel:nil complate:^(AAHttpToolMappingModel *result) {
        NSLog(@"result:%@",result.responseData);
        NSDictionary *dic = result.responseData;
        
        //2. arrays要追加数据
        [self.arrays addObjectsFromArray:[NSMutableArray arrayWithArray:[dic valueForKey:@"orderList"]]];
        
        //3.要结束刷新
        [weakSelf aa_endPagedRefreshWithTableView:_tbv totalPage:3];
    }];
}

- (IBAction)nextClick:(UIButton *)sender {
    
}

#pragma mark - TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentity];
    }
    cell.textLabel.text = [self.arrays[indexPath.row] valueForKey:@"shopperName"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrays.count;
}

@end
