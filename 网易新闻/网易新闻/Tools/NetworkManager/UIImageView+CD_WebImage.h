//
//  UIImageView+CD_WebImage.h
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CD_WebImage)

//设置URLString设置网络图片
- (void)cd_setImageWithURLString:(NSString *)urlString;
@end
