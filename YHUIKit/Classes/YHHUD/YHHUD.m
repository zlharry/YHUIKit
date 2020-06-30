//
//  YHHUD.m
//  EBHUDLib
//
//  Created by eybond on 2019/12/13.
//  Copyright © 2019 eybond. All rights reserved.
//

#import "YHHUD.h"


#define HUD_HIDE_TIME 3.5

@interface YHHUD ()
/** 提示的全局颜色 */
@property (nonatomic, strong) UIColor *hudGlobalColor;
/** 提示的全局内容颜色 */
@property (nonatomic, strong) UIColor *hudGlobalContentColor;

@end

@implementation YHHUD


+ (instancetype)shareInstance {
    static YHHUD *hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] init];
    });
    return hud;
    
    
}

+ (void)setGlobalColor:(UIColor *)color {
    [[self shareInstance] setHudGlobalColor:color];
}
+ (void)setGlobalContentColor:(UIColor *)contentColor {
    [[self shareInstance] setHudGlobalContentColor:contentColor];
}

/// 显示正在加载的图标在某个View上
/// @param view  需要遮盖的View
+ (instancetype)showLoadingOnView:(UIView *)view {
    if (nil == view) {
        return nil;
    }
    YHHUD *hud = [self showHUDAddedTo:view animated:YES];
    
    YHHUD *shareHud = [self shareInstance];
    if (shareHud.hudGlobalColor) {
        hud.backgroundColor = shareHud.hudGlobalColor;
    }
    
    if (shareHud.hudGlobalContentColor) {
        hud.contentColor = shareHud.hudGlobalContentColor;
    }
    
    return hud;
}

/// 显示正在加载的图标在某个View上，同时显示提示文字
/// @param view  需要遮盖的View
/// @param message 需要显示的提示文字
+ (instancetype)showLoadingOnView:(UIView *)view message:(NSString *)message {
    YHHUD *hud = [self showLoadingOnView:view];
    
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = hud.label.font;
    
    return hud;
}

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message {
    YHHUD *hud = [self showLoadingOnView:view];
    
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = hud.label.font;
    
    [hud setMode:MBProgressHUDModeText];
    
    [hud hideAnimated:YES afterDelay:HUD_HIDE_TIME];
    return hud;
}

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
/// @param afterDelay 显示时长（秒）
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message hideAfterDelay:(NSTimeInterval)afterDelay {
    YHHUD *hud = [self showLoadingOnView:view];
    
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = hud.label.font;
    
    [hud setMode:MBProgressHUDModeText];
    
    [hud hideAnimated:YES afterDelay:afterDelay];
    return hud;
}

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
/// @param completionBlock 当消失后执行的Block
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message completionBlock:(void(^)())completionBlock {
    YHHUD *hud = [self showLoadingOnView:view];
    
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = hud.label.font;
    
    [hud setMode:MBProgressHUDModeText];
    hud.completionBlock = completionBlock;
    [hud hideAnimated:YES afterDelay:HUD_HIDE_TIME];
    return hud;
}

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view  需要遮盖的View
/// @param message 需要显示的提示文字
/// @param afterDelay 显示时长（秒）
/// @param completionBlock 当消失后执行的Block
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message  hideAfterDelay:(NSTimeInterval)afterDelay completionBlock:(void(^)())completionBlock {
    YHHUD *hud = [self showLoadingOnView:view];
    
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = hud.label.font;
    
    [hud setMode:MBProgressHUDModeText];
    hud.completionBlock = completionBlock;
    [hud hideAnimated:YES afterDelay:afterDelay];
    return hud;
}

@end
