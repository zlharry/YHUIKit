//
//  YHSelectedOneListView.h
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YHSelectedOneListItem.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^YHSelectedOneListViewDidselectBlock) (YHSelectedOneListItem *item);

@interface YHSelectedOneListView : UIView
/** <#text#> */
@property (nonatomic, strong) NSArray<YHSelectedOneListItem *> *items;

/** <#text#> */
@property (nonatomic, copy) YHSelectedOneListViewDidselectBlock didselectedBlock;

+ (void)showInWindownWithItems:(NSArray<YHSelectedOneListItem *> *)items tineColor:(UIColor *)tineColor cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle didselectedBlock:(YHSelectedOneListViewDidselectBlock)didselectedBlock;
+ (void)showInWindownWithItems:(NSArray<YHSelectedOneListItem *> *)items defaultIndex:(NSInteger)defaultSelectIndex tineColor:(UIColor *)tineColor cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle didselectedBlock:(YHSelectedOneListViewDidselectBlock)didselectedBlock;
- (void)hide;
@end

NS_ASSUME_NONNULL_END
