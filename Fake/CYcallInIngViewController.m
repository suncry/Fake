//
//  CYcallInIngViewController.m
//  Fake
//
//  Created by cy on 14-1-23.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYcallInIngViewController.h"

@interface CYcallInIngViewController ()

@end

@implementation CYcallInIngViewController

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
    //先取消以前设定的  再设定新的
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePhone:(id)sender
{
    //取消通知 已停止铃声
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

}
- (IBAction)back:(id)sender
{
    //取消通知 已停止铃声
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

}

@end
