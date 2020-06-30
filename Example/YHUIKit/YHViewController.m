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
#import "YHSelectedOneListView.h"

@interface YHViewController ()
/** <#text#> */
@property (nonatomic, weak) YHHUD *hud;
@end

@implementation YHViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.hud = [YHHUD showLoadingOnView:self.view];
    
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:[YHSelectedOneListItem itemWithShowName:@"fadfsa" val:@"dfadf"]];
    
    [YHSelectedOneListView showInWindownWithItems:items tineColor:[UIColor orangeColor] cancelTitle:@"quxiao " sureTitle:@"确定-" didselectedBlock:^(YHSelectedOneListItem * _Nonnull item) {
        NSLog(@"%@", item);
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.hud hideAnimated:YES];
//
//    [YHHUD showMessageOnView:self.view message:@"kdfadsf"];
//    [YHAlertController showFromController:self title:@"dfasd" message:@"dfasd" preferredStyle:UIAlertControllerStyleAlert andConfigBlcok:^(UIAlertController * _Nonnull alertVC) {
//        ;
//    }];
}

@end
