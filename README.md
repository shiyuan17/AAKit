# AAKit
Ios快速开发库
   
##包含以下内容：
AAMockData:有意义测试模拟生成。   
AACategory:常用Category的整理编写。   
AAHttpTool：网络请求库封装，包括缓存、自动映射。   
AAHudTool：hud提示库封装。   
AAIBSetting：常用IB快捷操作封装。   
AAPageRefresh：分页封装  


项目依赖于以下库：PINCache、MJExtension、MBProgressHUD、MJRefresh
	
##使用Using
###AAHttpTool
提供以下方法进行restful网络请求：

    + (void)getWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;
    
    + (void)postWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;
    
    + (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;
    
    其它方式类似，在此不罗列。
    
    使用示例：
    
    //参数1url：url
    //参数2param：要传递的参数
    //参数3masspingModel：要映射的实体
    //回调4complate：AAHttpToolMappingModel result.mappingModel映射好的实体，result.errorMessage错误消息 result.code 错误编码
     [AAHttpTool getWithURL:@"http://bugfix-10032430.cos.myqcloud.com/getTest.json" params:nil mappingModel:[TestRequestModel class] complate:^(AAHttpToolMappingModel *result) {
        TestRequestModel *model = result.mappingModel;
        NSLog(@"errmsg:%@",model.errmsg);
        NSLog(@"model：%@",model.mj_keyValues);
    }];
    

###AAHudTool
提供以下方法进行Hud显示或隐藏

    - (void)aa_showLoadingWithText:(NSString *)text;/**<加载中文本提示消息*/
    - (void)aa_showMessageWithText:(NSString *)text;/**<普通文本提示消息*/
    - (void)aa_showProgressWithText:(NSString *)text;/**<进度信息*/
    - (void)aa_hideHud;/**<直接隐藏提示*/
    - (void)aa_hideHudWithText:(NSString *)text complete:(void (^)())complete;/**<提示后隐藏*/

    使用示例：
    
    //加载Loading
    [[AAHudTool sharedManager] aa_showLoadingWithText:@"数据加载中..."];
    
    //完成hidden
    [[AAHudTool sharedManager] aa_hideHud];

###AAPageRefresh
1.添加上拉下拉刷新：

    //1.添加刷新 指定tbv、array
    __weak __typeof(&*self) weakSelf = self;
    [self aa_addPageRefreshWithTabelView:_tbv data:self.arrays loadData:^{
       //处理刷新逻辑
       [weakSelf loadPageData];
    }];

2.请求加载完毕要为数组追加数据

    //2. arrays要追加数据
    [self.arrays addObjectsFromArray:[NSMutableArray arrayWithArray:[dic valueForKey:@"orderList"]]];
    
3.调用endPage结束刷新：

    [weakSelf aa_endPagedRefreshWithTableView:_tbv totalPage:3];

self.aa_currentPage 可以获取到当前页码，页码由AAPageRefresh内部管理。传递参数直接填写就好，页码会自动改变。

