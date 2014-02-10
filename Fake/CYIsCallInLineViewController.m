//
//  CYIsCallInLineViewController.m
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYIsCallInLineViewController.h"

@interface CYIsCallInLineViewController ()

@end

@implementation CYIsCallInLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults]stringForKey:@"callInName"].length < 1)
    {
        //如果用户不输入联系人...则显示如下
        nameLable.text = @"小张";
    }
    else
    {
        nameLable.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"callInName"];
    }
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if ([self.view bounds].size.height < 568)
    {
        [backgroundImgView setImage:[UIImage imageNamed:@"001(960)"]];
    }

    
    
    //计时
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTime) userInfo:nil repeats:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showTime
{
    if ([secLable.text intValue]< 59)
    {
        if ([secLable.text intValue]+1 < 10)
        {
            secLable.text = [NSString stringWithFormat:@"0%d",[secLable.text intValue]+1];
            
        }
        else
        {
            secLable.text = [NSString stringWithFormat:@"%d",[secLable.text intValue]+1];
            
        }
    }
    else
    {
        secLable.text = [NSString stringWithFormat:@"00"];
        if ([minLable.text intValue]+1 <10)
        {
            minLable.text = [NSString stringWithFormat:@"0%d",[minLable.text intValue]+1];
            
        }
        else
        {
            minLable.text = [NSString stringWithFormat:@"%d",[minLable.text intValue]+1];
            
        }
    }
}

@end
