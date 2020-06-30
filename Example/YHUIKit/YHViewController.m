//
//  YHViewController.m
//  YHUIKit
//
//  Created by yuanhua_zhong@icloud.com on 06/30/2020.
//  Copyright (c) 2020 yuanhua_zhong@icloud.com. All rights reserved.
//

#import "YHViewController.h"
#import "YHHUD.h"
#import "YHAlertController.h"

@interface YHViewController ()
/** <#text#> */
@property (nonatomic, weak) YHHUD *hud;
@end

@implementation YHViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.hud = [YHHUD showLoadingOnView:self.view];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.hud hideAnimated:YES];
        
    [YHHUD showMessageOnView:self.view message:@"kdfadsf"];
    [YHAlertController showFromController:self title:@"dfasd" message:@"dfasd" preferredStyle:UIAlertControllerStyleAlert andConfigBlcok:^(UIAlertController * _Nonnull alertVC) {
        ;
    }];
}

@end
