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
    


