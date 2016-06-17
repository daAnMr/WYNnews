//
//  WYChannlView.m
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYChannlView.h"
#import "WYChannlModel.h"
#import "WYChannelLable.h"
@interface WYChannlView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
@implementation WYChannlView

+ (instancetype)channlView {

    UINib *nib = [UINib nibWithNibName:@"WYChannlView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;


}

#pragma mark--设置数据
-(void)setChannelList:(NSArray<WYChannlModel *> *)channelList {

    _channelList = channelList;
    
    //1.初始化数据
    CGFloat x =20;
    CGFloat margin = 8;
    CGFloat height = _scrollView.bounds.size.height;
    
    //添加控件
    for (WYChannlModel *chanel in channelList) {
        
        WYChannelLable *l = [WYChannelLable channelLableWithTitle:chanel.tname];
        
        //2.设置lable位置
        l.frame = CGRectMake(x, 0, l.bounds.size.width, height);
        
        //3.递增x
        x += l.bounds.size.width + margin;
        
        [_scrollView addSubview:l];
    }

    //scrollView的contentSize
    _scrollView.contentSize = CGSizeMake(x, height);
    
    //取消滚动指示器
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;


}
@end
