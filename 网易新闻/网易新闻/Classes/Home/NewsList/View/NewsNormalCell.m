//
//  NewsNormalCell.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "NewsNormalCell.h"

@implementation NewsNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _replyLable.backgroundColor = [UIColor cz_colorWithHex:0xf1f1f1];
    _replyLable.layer.cornerRadius = 4;
    _replyLable.layer.masksToBounds = YES;
}


@end
