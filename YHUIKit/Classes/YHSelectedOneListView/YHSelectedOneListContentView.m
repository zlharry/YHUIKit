//
//  YHSelectedOneListContentView.m
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import "YHSelectedOneListContentView.h"
#import "YHSelectedOneListItem.h"
//#import "UILabel+YH.h"

@interface YHSelectedOneListContentView () <UIPickerViewDataSource, UIPickerViewDelegate>
/** <#text#> */
@property (nonatomic, weak) UIPickerView *pickerView;
/** 确定按钮 */
@property (nonatomic, weak) UIButton *sureBtn;
/** 取消按钮 */
@property (nonatomic, weak) UIButton *cancelBtn;
@end

@implementation YHSelectedOneListContentView

- (instancetype)init {
    if ([super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    CGFloat cancelX = 0;
    CGFloat cancelY = 0;
    CGFloat cancelW = [self.cancelBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.cancelBtn.titleLabel.font} context:nil].size.width + 20;
    CGFloat cancelH = 30;
    self.cancelBtn.frame = CGRectMake(cancelX, cancelY, cancelW, cancelH);
    
    CGFloat sureY = cancelY;
    CGFloat sureW = [self.sureBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.cancelBtn.titleLabel.font} context:nil].size.width + 20;
    CGFloat sureH = cancelH;
    CGFloat sureX = self.frame.size.width - sureW;
    self.sureBtn.frame = CGRectMake(sureX, sureY, sureW, sureH);
    
    CGFloat pickX = 0;
    CGFloat pickY = 30;
    CGFloat pickW = self.frame.size.width;
    CGFloat pickH = self.frame.size.height - pickY;
    self.pickerView.frame = CGRectMake(pickX, pickY, pickW, pickH);
}

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        [self addSubview:pickerView];
        _pickerView = pickerView;
        
        pickerView.dataSource = self;
        pickerView.delegate = self;
    }
    return _pickerView;
}

- (void)setItems:(NSArray<YHSelectedOneListItem *> *)items {
    _items = items;
    
    [self.pickerView reloadAllComponents];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
   
    return self.items.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.items[row].showName;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

/** 确定按钮 */
- (UIButton *)sureBtn {
    if (!_sureBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [self addSubview:btn];
        _sureBtn = btn;
        
//        [btn setTitle:NSLocalizedString(@"global_2", @"确定") forState:UIControlStateNormal];
//        [btn setTitleColor:globoldColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (void)setSureTitle:(NSString *)sureTitle {
    _sureTitle = sureTitle;
    [self.sureBtn setTitle:sureTitle forState:UIControlStateNormal];
}

- (void)setCancelTitle:(NSString *)cancelTitle {
    _cancelTitle = cancelTitle;
    [self.cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
}

- (void)setTineColor:(UIColor *)tineColor {
    _tineColor = tineColor;
    [self.sureBtn setTitleColor:tineColor forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:tineColor forState:UIControlStateNormal];
}

/** 取消按钮 */
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [self addSubview:btn];
        _cancelBtn = btn;
        
//        [btn setTitle:NSLocalizedString(@"global_4", @"取消")  forState:UIControlStateNormal];
//        [btn setTitleColor:globoldColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (void)cancelBtnClicked {
    if ([self.delegate respondsToSelector:@selector(contentViewCancelBtnClicked:)]) {
        [self.delegate contentViewCancelBtnClicked:self];
    }
}
- (void)sureBtnClicked {
    if ([self.delegate respondsToSelector:@selector(contentViewSureBtnClciked:)]) {
        [self.delegate contentViewSureBtnClciked:self];
    }
}

- (YHSelectedOneListItem *)currentItem {
    if (self.items.count == 0) return nil;
    
    NSInteger index = [self.pickerView selectedRowInComponent:0];
    
    if (index < 0 || index >= self.items.count) {
        return nil;
    } else {
        return self.items[index];
    }
}

- (void)setCurrentItem:(YHSelectedOneListItem *)currentItem {
    
    NSInteger index = 0;
    for (NSInteger ind = 0; ind < self.items.count; ind++) {
        YHSelectedOneListItem *it = self.items[ind];
        if ([it.val isEqualToString:currentItem.val]) {
            index = ind;
            break;
        }
    }
    
    [self.pickerView selectRow:index inComponent:0 animated:YES];
}

@end
