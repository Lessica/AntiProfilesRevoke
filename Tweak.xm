#import <UIKit/UIKit.h>

%group OS11
// iOS 11 - 13
%hook FBApplicationTrustData
- (unsigned long long)trustStateWithTrustRequiredReasons:(unsigned long long*)arg1 {
	return 2;
    /***
    0 软件不可用
    1 恶意软件
    2 所有可用
    3 未受信任
    4 无法验证
    >=5 软件不可用
    ***/
}
%end

%end

%group OS14
// iOS 14 or above
%hook FBSSignatureValidationService
- (unsigned long long)trustStateForApplication:(id)arg1 {
    return 8;
    /***
    0，1 点击无反应
    2 恶意软件
    3，4，5 软件不可用
    6 无法验证
    7 未受信任
    8 所有可用
    ***/
}
%end

%end


%ctor {
    if (@available(iOS 14.0, *)) {
    %init(OS14);
    } else {
    %init(OS11);
  }
}
