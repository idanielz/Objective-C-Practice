//
//  main.m
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AmakerAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AmakerAppDelegate class]));
    }
}


/*********本节内容提要************/

// 1. 简介
// 2. 添加 sqlite 类库
// 3. 设置数据库保存路径
// 4. 打开库 sqlite3_open
// 5. 关闭库 sqlite3_close
// 6. 执行sql语句 sqlite3_exec 例如，创建表
// 7. 执行预定义语句 sqlite3_prepare_v2
// 8. 执行预定义 sqlite3_step
// 9. 获得列数据 sqlite3_column_xxx
// 10. 绑定变量  sqlite3_bind_xxx
// 11. 终止stmt sqlite3_finalize
// 12. 参考本节案例代码




