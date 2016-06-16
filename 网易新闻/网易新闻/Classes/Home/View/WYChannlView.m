//
//  WYChannlView.m
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYChannlView.h"
#import "WYChannlModel.h"

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
    
    //添加控件
    for (WYChannlModel *chanel in channelList) {
        
        UILabel *l = [UILabel cz_labelWithText:chanel.tname fontSize:14 color:[UIColor blackColor]];
        
        [_scrollView addSubview:l];
    }



}
@end
