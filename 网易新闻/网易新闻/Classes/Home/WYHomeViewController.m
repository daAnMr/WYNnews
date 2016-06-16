//
//  WYHomeViewController.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYChannlView.h"
#import "WYChannlModel.h"
@interface WYHomeViewController ()
//频道视图
@property (nonatomic,weak) WYChannlView *channelView;
@end

@implementation WYHomeViewController {

    NSArray <WYChannlModel *> *_channelList;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    //加载频道数据
    _channelList = [WYChannlModel channelList];
    
    //设置数据
    _channelView.channelList = _channelList;
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
    _channelView = cv;
}

@end
