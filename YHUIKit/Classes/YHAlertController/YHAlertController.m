//
//  EBAlertController.m
//  EBHUDLib -=-=-=
//
//  Created by eybond on 2019/12/13.
//  Copyright © 2019 eybond. All rights reserved.
//

#import "YHAlertController.h"

@interface YHAlertController ()
/** 是否已经观察了Window */
@property (nonatomic, assign) BOOL haveAddWindowAbserver;
@end

@implementation YHAlertController

/// 弹出显示
- (void)showFromController:(nullable UIViewController *)controller {
    if (controller) {
        [controller presentViewController:self
                                 animated:YES
                               completion:nil];
    } else {
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        [window.rootViewController presentViewController:self
                                                animated:YES
                                              completion:nil];
        
        if (!self.haveAddWindowAbserver) {
            [window addObserver:self forKeyPath:@"rootViewController" options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"rootViewController"]) {
        [self dismissViewControllerAnimated:NO completion:nil];
        [self showFromController:nil];
    }
}

- (void)dealloc {
    if (self.haveAddWindowAbserver) {
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        [window removeObserver:self forKeyPath:@"rootViewController"];
    }
}

/// 弹出显示
+ (instancetype)showWithTitle:(nullable NSString *)title
                      message:(nullable NSString *)message
               preferredStyle:(UIAlertControllerStyle)preferredStyle
               andConfigBlcok:(nullable void(^)(UIAlertController *alertVC))configBlcok {
    
    return [self showFromController:nil
                              title:title
                            message:message
                     preferredStyle:preferredStyle
                     andConfigBlcok:configBlcok];
}


+ (instancetype)showFromController:(nullable UIViewController *)controller
                             title:(nullable NSString *)title
                           message:(nullable NSString *)message
                    preferredStyle:(UIAlertControllerStyle)preferredStyle
                    andConfigBlcok:(nullable void(^)(UIAlertController *alertVC))configBlcok {
    
    if (UIAlertControllerStyleActionSheet == preferredStyle && [self isIPad]) {
        preferredStyle = UIAlertControllerStyleAlert; //
    }
    
    // 初始化
    YHAlertController *alertVC = [self alertControllerWithTitle:title
                                                        message:message
                                                 preferredStyle:preferredStyle];
    
    // 配置弹出
    __weak typeof(alertVC) weakAlert = alertVC;
    if (configBlcok) {
        configBlcok(weakAlert);
    }
    
    // 弹出显示
    [alertVC showFromController:controller];
    
    return alertVC;
}


/// 判断当前设备是否是iPad
+ (BOOL)isIPad {
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if ([deviceType rangeOfString:@"iPad"].length > 0) {
        return YES;
    }
    
    return NO;
}

@end
