#include <substrate.h>

%hook ClassName

- (void)methodName {
    // 插件功能代码
    %orig;
}

%end
