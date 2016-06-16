//
//  WYNewCell.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYNewCell.h"

@implementation WYNewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _replyLable.backgroundColor = [UIColor cz_colorWithHex:0xf1f1f1];
    _replyLable.layer.cornerRadius = 4;
    _replyLable.layer.masksToBounds = YES;

}

- (void)setModel:(WYNewListModl *)model {

    _model = model;
    _sourceLabel.text = model.source;
    _titleLeble.text = model.title;
    NSURL *iconURL = [NSURL URLWithString:model.imgsrc];
    [_iconView sd_setImageWithURL:iconURL];
    
    if (model.imgextra != nil) {
        
        NSInteger index = 0;
        
        for (NSDictionary *dict in model.imgextra) {
            
            NSString *urlString = dict[@"imgsrc"];
            NSURL *url = [NSURL URLWithString:urlString];
            
            [_extraimageView[index] sd_setImageWithURL:url];
            
            index++;
        }
    }


    _replyLable.text = [NSString stringWithFormat:@"%zd",model.replyCount];
}

@end
