//
//  UIViewController+PageRefresh.h
//  ZJZCProject
//
//  Created by A on 16/6/22.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AAPageRefresh)
@property (nonatomic,assign) int currentPage;


- (void)addPageRefreshWithTabelView:(UITableView *)tbv data:(NSMutableArray *)array loadData:(void(^)())loadData;/**<为tableview添加上拉下拉刷新 tbv,数据*/
- (void)endPagedRefreshWithTableView:(UITableView *)tbv data:(NSMutableArray *)array totalPage:(int)totalPage;/**<结束tableview刷新*/

- (void)endAllRefreshWithTalbeView:(UITableView *)tbv;
@end
