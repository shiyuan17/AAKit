//
//  UIViewController+PageRefresh.m
//  ZJZCProject
//
//  Created by A on 16/6/22.
//  Copyright © 2016年 BoShang. All rights reserved.
//

#import "UIViewController+AAPageRefresh.h"
#import "MJRefresh.h"

static const void *currentPageKey = &currentPageKey;
@implementation UIViewController (PageRefresh)

- (int)currentPage{
    return [objc_getAssociatedObject(self, currentPageKey) intValue];
}

- (void)setCurrentPage:(int)currentPage{
    NSString *page = [NSString stringWithFormat:@"%d",currentPage];
    objc_setAssociatedObject(self, currentPageKey, page, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addPageRefreshWithTabelView:(UITableView *)tbv data:(NSMutableArray *)array loadData:(void(^)())loadData {
    __weak typeof(self) weakSelf = self;
    tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.currentPage = 1;
        [array removeAllObjects];
        if (loadData) {
            loadData();
        }
    }];
    [tbv.mj_header beginRefreshing];
    
    tbv.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.currentPage = weakSelf.currentPage + 1;
        if (loadData) {
            loadData();
        }
    }];
    
}

- (void)endPagedRefreshWithTableView:(UITableView *)tbv data:(NSMutableArray *)array totalPage:(int)totalPage{
    if (self.currentPage>=totalPage) {
        [tbv.mj_footer endRefreshingWithNoMoreData];
    }else{
        [tbv.mj_header endRefreshing];
        [tbv.mj_footer endRefreshing];
    }
}

- (void)endAllRefreshWithTalbeView:(UITableView *)tbv{
    [tbv.mj_header endRefreshing];
    [tbv.mj_footer endRefreshing];
}
@end
