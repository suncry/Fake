//
//  PushNotification.m
//  CyClock
//
//  Created by Suncry on 13-6-15.
//  Copyright (c) 2013年 ipointek. All rights reserved.
//

#import "PushNotification.h"
//#import "MyDB.h"


@implementation PushNotification

- (void)setClock
{
    //取消通知：
    //通知完一定要取消，IOS最多允许最近本地通知数量是64个，超过限制的本地通知将被忽略。
    //1：删除应用所有通知
//    NSLog(@"/////////////////////////////////////////////////////////////////////////////////////");

    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UILocalNotification *sleepNotification = [[UILocalNotification alloc] init];
    if (sleepNotification)
    {
        //时区
        sleepNotification.timeZone=[NSTimeZone defaultTimeZone];
        //推送时间---根据用户设置
        sleepNotification.fireDate= [[NSUserDefaults standardUserDefaults]valueForKey:@"CallInTime"];
        //            NSLog(@"-->sleepNotificationTime == %@",(NSDate *)[[NSUserDefaults standardUserDefaults]valueForKey:@"sleepNotificationTime"]);
        //推送内容
        sleepNotification.alertBody = NSLocalizedString(@"ringText", @"");
        //应用右上角红色图标数字
        //newNotification.applicationIconBadgeNumber = 0;
        [sleepNotification setSoundName:@"MyRing.mp3"];
        //设置按钮
        sleepNotification.alertAction = @"关闭";
        //设置重复
        sleepNotification.repeatInterval = 0;
        [[UIApplication sharedApplication] scheduleLocalNotification:sleepNotification];
        NSLog(@"来电设定了！");
    }
}
@end
