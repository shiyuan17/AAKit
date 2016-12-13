//
//  UIViewController+PageRefresh.h
//  ZJZCProject
//
//  Created by A on 16/6/22.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AAPageRefresh)
@property (nonatomic, strong) NSString *aa_currentPage;


- (void)aa_addAutoPageRefreshWithTabelView:(UITableView *)tbv data:(NSMutableArray *)array loadData:(void(^)())loadData;
- (void)aa_addPageRefreshWithTabelView:(UITableView *)tbv data:(NSMutableArray *)array loadData:(void(^)())loadData;/**<为tableview添加上拉下拉刷新 tbv,数据*/
- (void)aa_endPagedRefreshWithTableView:(UITableView *)tbv totalPage:(int)totalPage;/**<结束tableview刷新*/

- (void)aa_endAllRefreshWithTalbeView:(UITableView *)tbv;
@end
