//
//  WYNewListModl.h
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewListModl : NSObject
//标题
@property (nonatomic, copy) NSString *title;

//配图地址
@property (nonatomic, copy) NSString *imgsrc;

//来源
@property (nonatomic, copy) NSString *source;

//评论数
@property (nonatomic, assign) NSInteger replyCount;

//代号
@property (nonatomic, copy) NSString *docid;

//多图
@property (nonatomic, strong) NSArray *imgextra;

//是否大图标记
@property (nonatomic,assign) BOOL imgType;

//是否是顶部cell
@property (nonatomic,assign) BOOL hasHead;

@end
