//
//  YHSelectedOneListView.m
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import "YHSelectedOneListView.h"
#import "YHSelectedOneListContentView.h"

#define ANIMATION_TIME 0.3

@interface YHSelectedOneListView () <YHSelectedOneListContentViewDelegate>
/** <#text#> */
@property (nonatomic, weak) YHSelectedOneListContentView *contView;
/** <#text#> */
@property (nonatomic, copy) NSString *sureTitle;
/** <#text#> */
@property (nonatomic, copy) NSString *cancelTitle;
/** <#text#> */
@property (nonatomic, strong) UIColor *tineColor;
@end

@implementation YHSelectedOneListView


+ (void)showInWindownWithItems:(NSArray<YHSelectedOneListItem *> *)items tineColor:(UIColor *)tineColor cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle didselectedBlock:(YHSelectedOneListViewDidselectBlock)didselectedBlock {
    [self showInWindownWithItems:items defaultIndex:0 tineColor:tineColor cancelTitle:cancelTitle sureTitle:sureTitle didselectedBlock:didselectedBlock];
}

+ (void)showInWindownWithItems:(NSArray<YHSelectedOneListItem *> *)items defaultIndex:(NSInteger)defaultSelectIndex tineColor:(UIColor *)tineColor cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle didselectedBlock:(YHSelectedOneListViewDidselectBlock)didselectedBlock {
    
    if (items.count <= 0) {
        return;
    }
    
    UIWindow *windown = [UIApplication sharedApplication].keyWindow;
    YHSelectedOneListView *listView = [[YHSelectedOneListView alloc] init];
    [windown addSubview:listView];
    listView.frame = windown.bounds;
    listView.items = items;
    listView.didselectedBlock = didselectedBlock;
    listView.cancelTitle = cancelTitle;
    listView.sureTitle = sureTitle;
    listView.tineColor = tineColor;
    
    listView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    CGFloat contX = 0;
    CGFloat contW = listView.frame.size.width;
    CGFloat contH = contW * 0.7;
    CGFloat contY = listView.frame.size.height;
    listView.contView.frame = CGRectMake(contX, contY, contW, contH);
    contY = listView.frame.size.height - contH;
    
    
    if (defaultSelectIndex < 0) {
        defaultSelectIndex = 0;
    } else if (defaultSelectIndex >= items.count) {
        defaultSelectIndex = items.count - 1;
    }
    if (items.count > defaultSelectIndex && defaultSelectIndex >= 0) {
        listView.contView.currentItem = items[defaultSelectIndex];
    }
    

    listView.contView.cancelTitle = cancelTitle;
    listView.contView.sureTitle = sureTitle;
    listView.contView.tineColor = tineColor;
    
    [UIView animateWithDuration:ANIMATION_TIME
                     animations:^{
                         listView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
                         listView.contView.frame = CGRectMake(contX, contY, contW, contH);
                     }];
}

- (void)hide {
    
    UIWindow *windown = [UIApplication sharedApplication].keyWindow;
    
    CGFloat contX = 0;
    CGFloat contW = self.frame.size.width;
    CGFloat contH = contW * 0.9;
    CGFloat contY = self.frame.size.height;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:ANIMATION_TIME
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
                         self.contView.frame = CGRectMake(contX, contY, contW, contH);
                     }
                     completion:^(BOOL finished) {
                         [weakSelf removeFromSuperview];
                     }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hide];
}

- (YHSelectedOneListContentView *)contView {
    if (!_contView) {
        YHSelectedOneListContentView *contView = [[YHSelectedOneListContentView alloc] init];
        [self addSubview:contView];
        _contView = contView;
        
        contView.delegate = self;
    }
    return _contView;
}


- (void)setItems:(NSArray<YHSelectedOneListItem *> *)items {
    _items = items;
    self.contView.items = items;
}

#pragma mark - YHSelectedOneListContentViewDelegate
- (void)contentViewSureBtnClciked:(YHSelectedOneListContentView *)contentView {
    
    if (self.didselectedBlock) {
        self.didselectedBlock(contentView.currentItem);
    }
    
    [self hide];
}

- (void)contentViewCancelBtnClicked:(YHSelectedOneListContentView *)contentView {
    
    [self hide];
}

@end
