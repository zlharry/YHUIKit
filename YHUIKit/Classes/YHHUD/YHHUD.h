//
//  YHHUD.h
//  EBHUDLib
//
//  Created by eybond on 2019/12/13.
//  Copyright © 2019 eybond. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHHUD : MBProgressHUD
+ (void)setGlobalColor:(UIColor *)color;
+ (void)setGlobalContentColor:(UIColor *)contentColor;

/// 显示正在加载的图标在某个View上
/// @param view  需要遮盖的View
+ (instancetype)showLoadingOnView:(UIView *)view;

/// 显示正在加载的图标在某个View上，同时显示提示文字
/// @param view  需要遮盖的View
/// @param message 需要显示的提示文字
+ (instancetype)showLoadingOnView:(UIView *)view message:(NSString *)message;

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message;

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
/// @param afterDelay 显示时长（秒）
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message hideAfterDelay:(NSTimeInterval)afterDelay;

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view 需要遮盖的View
/// @param message 需要显示的提示文字
/// @param completionBlock 当消失后执行的Block
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message completionBlock:(void(^)(void))completionBlock;

/// 显示提示文字在某个View上，一段时间后自动消失
/// @param view  需要遮盖的View
/// @param message 需要显示的提示文字
/// @param afterDelay 显示时长（秒）
/// @param completionBlock 当消失后执行的Block
+ (instancetype)showMessageOnView:(UIView *)view message:(NSString *)message  hideAfterDelay:(NSTimeInterval)afterDelay completionBlock:(void(^)(void))completionBlock;
@end

NS_ASSUME_NONNULL_END
