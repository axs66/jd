#include <substrate.h>
#include <UIKit/UIKit.h>
#include <Foundation/Foundation.h>

%hook UIApplication

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    // 你的代码在这里执行，例如加载 JavaScript 脚本
    NSString *scriptPath = @"/Library/Application Support/jdTweak/script.js";
    if ([[NSFileManager defaultManager] fileExistsAtPath:scriptPath]) {
        // 这里可以调用你需要执行 JavaScript 的方法
        // 例如启动 QX 或者设置脚本执行环境
    }
    
    %orig; // 保持原本的应用启动行为
}

%end
