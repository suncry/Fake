//
//  RecommendationAPPCell.m
//  时光闹钟
//
//  Created by Suncry on 13-9-24.
//  Copyright (c) 2013年 ipointek. All rights reserved.
//

#import "RecommendationAPPCell.h"

@implementation RecommendationAPPCell
@synthesize appImageView = _appImageView;
@synthesize appNameLable = _appNameLable;
@synthesize appInfoLable = _appInfoLable;
@synthesize downloadBtn = _downloadBtn;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.appNameLable = [[UILabel alloc]initWithFrame:CGRectMake(74, 12, 174, 24)];
        self.appNameLable.font = [UIFont boldSystemFontOfSize:14.0f];
        self.appNameLable.backgroundColor = [UIColor clearColor];
        [self addSubview:self.appNameLable];
        self.appInfoLable = [[UILabel alloc]initWithFrame:CGRectMake(74, 32, 174, 36)];
        self.appInfoLable.backgroundColor = [UIColor clearColor];
        self.appInfoLable.font = [UIFont systemFontOfSize:12.0f];
        self.appInfoLable.lineBreakMode = NSLineBreakByTruncatingTail;
        //自动折行设置
        self.appInfoLable.numberOfLines = 0;

        self.appInfoLable.textColor = [UIColor darkGrayColor];
        [self addSubview:self.appInfoLable];
        self.appImageView = [[UIImageView alloc]initWithFrame:CGRectMake(11, 15, 50, 50)];
        [self addSubview:self.appImageView];
        self.downloadBtn = [[UIButton alloc]initWithFrame:CGRectMake(263, 24, 44, 21)];
        
        [self.downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [self.downloadBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [[self.downloadBtn layer] setBorderWidth:1.0f];
        [[self.downloadBtn layer] setBorderColor:[UIColor blackColor].CGColor];


        [self addSubview:self.downloadBtn];
        
        UILabel *lineLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 79, 320, 1)];
        lineLable.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:lineLable];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
