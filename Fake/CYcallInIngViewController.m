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
    
    if ([self.view bounds].size.height < 568)
    {
        [backgroundImgView setImage:[UIImage imageNamed:@"003(960)"]];
    }

    
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
    if ([self.view bounds].size.height < 568)
    {
        [backgroundImgView setImage:[UIImage imageNamed:@"001(960)"]];
    }


    //播放音乐设置
    NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"MyRing" ofType:@"mp3"];       //创建音乐文件路径
    NSURL *musicURL = [[NSURL alloc] initFileURLWithPath:musicFilePath];
    
    AVAudioPlayer *thePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.ring = thePlayer;
    //创建播放器
    //    [thePlayer prepareToPlay];
    [self.ring setVolume:1];   //设置音量大小
    self.ring.numberOfLoops = -1;//设置音乐播放次数  -1为一直循环
    [self.ring play];   //播放


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePhone:(id)sender
{
    [self.ring stop];   //

    //取消通知 已停止铃声
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

}
- (IBAction)back:(id)sender
{
    [self.ring stop];   //

    //取消通知 已停止铃声
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

}

@end
