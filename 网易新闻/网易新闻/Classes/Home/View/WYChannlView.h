//
//  WYChannlView.h
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYChannlModel;
@interface WYChannlView : UIView

//从xib加载并返回视图
+ (instancetype)channlView;

//频道列表的数组
@property (nonatomic,strong) NSArray <WYChannlModel *> *channelList;
@end
