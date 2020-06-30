//
//  YHSelectedOneListContentView.h
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YHSelectedOneListItem, YHSelectedOneListContentView;

@protocol YHSelectedOneListContentViewDelegate <NSObject>

@optional
- (void)contentViewCancelBtnClicked:(YHSelectedOneListContentView *)contentView;
- (void)contentViewSureBtnClciked:(YHSelectedOneListContentView *)contentView;

@end
@interface YHSelectedOneListContentView : UIView
/** 当前选择的Item */
@property (nonatomic, strong) YHSelectedOneListItem *currentItem;
/** <#text#> */
@property (nonatomic, strong) NSArray<YHSelectedOneListItem *> *items;
/** <#text#> */
@property (nonatomic, weak) id<YHSelectedOneListContentViewDelegate> delegate;
/** <#text#> */
@property (nonatomic, copy) NSString *sureTitle;
/** <#text#> */
@property (nonatomic, copy) NSString *cancelTitle;
/** <#text#> */
@property (nonatomic, strong) UIColor *tineColor;

@end

NS_ASSUME_NONNULL_END
