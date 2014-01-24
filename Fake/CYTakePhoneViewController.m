//
//  CYTakePhoneViewController.m
//  Fake
//
//  Created by cy on 14-1-14.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYTakePhoneViewController.h"

@interface CYTakePhoneViewController ()

@end

@implementation CYTakePhoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    min = 1;
//    [timePicker selectedRowInComponent:0]
//    timePicker.showsSelectionIndicator = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 8;
}
// returns width of column and height of row for each component.
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    
//}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0)
    {
        return @"1分钟之后";
    }
    if (row == 1)
    {
        return @"5分钟之后";
    }
    if (row == 2)
    {
        return @"10分钟之后";
    }
    if (row == 3)
    {
        return @"20分钟之后";
    }
    if (row == 4)
    {
        return @"30分钟之后";
    }
    if (row == 5)
    {
        return @"1个小时之后";
    }
    if (row == 6)
    {
        return @"2个小时之后";
    }

    else
    {
        return @"3个小时之后";
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSLog(@"pickerView 选择了!");
    if (row == 0)
    {
        min = 1;
    }
    if (row == 1)
    {
        min = 5;
    }
    if (row == 2)
    {
        min = 10;
    }
    if (row == 3)
    {
        min = 20;
    }
    if (row == 4)
    {
        min = 30;
    }
    if (row == 5)
    {
        min = 60;
    }
    if (row == 6)
    {
        min = 120;
    }
    else
    {
        min = 180;
    }
}
- (IBAction)okBtnClick:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:nameTextView.text forKey:@"callInName"];

    [self setTime];
}
//设置多少分钟之后 来电
- (void)setTime
{
    //取消通知：
    //通知完一定要取消，IOS最多允许最近本地通知数量是64个，超过限制的本地通知将被忽略。
    //1：删除应用所有通知
    //    NSLog(@"/////////////////////////////////////////////////////////////////////////////////////");
    //先取消以前设定的  再设定新的
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UILocalNotification *callNotification = [[UILocalNotification alloc] init];
    if (callNotification)
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert];
        

        //时区
        callNotification.timeZone=[NSTimeZone defaultTimeZone];
        //推送时间---根据用户设置
        callNotification.fireDate= [NSDate dateWithTimeIntervalSinceNow:min*60];

        //推送内容
        callNotification.alertBody = NSLocalizedString(@"电话来了!!!", @"");
        //应用右上角红色图标数字
        //newNotification.applicationIconBadgeNumber = 0;
        [callNotification setSoundName:@"MyRing.mp3"];
        //设置按钮
        callNotification.alertAction = @"关闭";
        //设置重复
        callNotification.repeatInterval = 0;
        [[UIApplication sharedApplication] scheduleLocalNotification:callNotification];
        NSLog(@"callNotification == %@",callNotification);
        NSLog(@"min == %d",min);
        NSLog(@"来电设定了！");
    }
}
/**
 *  uitextView的代理方法 实现palceholder
 *
 *  @param textView
 */

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        nameLablePlaceHolder.text = @"联系人姓名/电话号码";
    }
    else
    {
        nameLablePlaceHolder.text = @"";
    }
}

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    //判断加上输入的字符，是否超过界限
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    if (str.length > 20)
    {
        textView.text = [str substringToIndex:20];
        return NO;
    }
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    //    NSLog(@"textView.text.length == %d",textView.text.length);
    //该判断用于联想输入
    if (textView.text.length > 20)
    {
        NSLog(@"超出了 20 字符的限制");
        textView.text = [textView.text substringToIndex:20];
    }
    
}

- (void)tap
{
    [nameTextView resignFirstResponder];
}
@end
