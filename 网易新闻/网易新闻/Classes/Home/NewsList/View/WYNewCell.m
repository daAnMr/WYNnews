//
//  WYNewCell.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYNewCell.h"

@interface WYNewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLeble;

@property (weak, nonatomic) IBOutlet UILabel *replyLable;

@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *extraimageView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end
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
    
    //设置图片
//    NSURL *iconURL = [NSURL URLWithString:model.imgsrc];
    [_iconView cd_setImageWithURLString:model.imgsrc];
    
    if (model.imgextra != nil) {
        
        NSInteger index = 0;
        
        for (NSDictionary *dict in model.imgextra) {
            
        [_extraimageView[index++] cd_setImageWithURLString:dict[@"imgsrc"]];
        
        }
    }


    _replyLable.text = [NSString stringWithFormat:@"%zd",model.replyCount];
}

@end
