//
//  WYHomeViewController.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYChannlView.h"
@interface WYHomeViewController ()

@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark--设置界面
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor cz_randomColor];

    //1.添加频道视图
    WYChannlView *cv = [WYChannlView channlView];
    [self.view addSubview:cv];
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(38);
    }];

}

@end
