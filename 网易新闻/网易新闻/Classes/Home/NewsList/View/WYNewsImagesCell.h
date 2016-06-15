//
//  WYNewsImagesCell.h
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsImagesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLeble;

@property (weak, nonatomic) IBOutlet UILabel *replyLable;
@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *extraimageView;

@end
