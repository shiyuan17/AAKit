# AAKit
Ios快速开发库
   
#目录结构：   
	1.AACategory 常用分类  
		AATextFiled   
		AAFont   
		AAUIButton   
		AAView   
	2.AAHttpTool 网络工具类封装   
		AAHttpTool 需要用到的网络工具类   
		HttpTool+AATips 包含提示的网络工具类   
		Category 网络请求用到的分类   
		Lib      使用到的第三方库   

	3.AAHudTool  通用提示hud工具类   
	4.AAIBSetting  ib显示工具类   
	5.AAMacro  通用宏   
	6.AAPageRefresh  上拉下拉分页封装   
	7.Repository  第三方库   

#使用Api:   
##1.AACategory   
	1.1:AAFont包含了适配屏幕字体大小    
	1.2:UIButton+AAClickRect 设置最小点击区域   

##2.AAHttpTool   
	2.1:AAHttpTool.h    
	包含如下公开方法：   
	get、post、postFile、put、delete请求；params是请求需要的参数；mappingModel是为要映射的实体(把服务器端返回的json转换成对象);complate请求处理完的回调   
	+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)putWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)deleteWithURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   

	2.2：HttpTool+AATips.h 包含自动的提示   
	+ (void)autoTipsWithGetURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)autoTipsWithPostURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)autoTipsWithPutURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
	+ (void)autoTipsWithDeleteURL:(NSString *)url params:(NSDictionary *)params mappingModel:(Class)mappingModel complate:(void (^)(AAHttpToolMappingModel *))complate;   
