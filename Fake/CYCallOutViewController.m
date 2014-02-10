//
//  CYCallOutViewController.m
//  Fake
//
//  Created by cy on 14-1-15.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYCallOutViewController.h"
#import "CYCallOutIngViewController.h"
@interface CYCallOutViewController ()

@end

@implementation CYCallOutViewController
@synthesize name;
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
    startBtn.layer.masksToBounds = YES;
    startBtn.layer.cornerRadius = 5;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        nameLablePlaceHolder.text = @"联系人姓名";
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
    //禁止换行...实现 done 按钮
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }

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
- (IBAction)startCallOut:(id)sender
{
    NSLog(@"callOutName 写入之前 == %@",[[NSUserDefaults standardUserDefaults]stringForKey:@"callOutName"]);
    [[NSUserDefaults standardUserDefaults]setObject:nameTextView.text forKey:@"callOutName"];
    NSLog(@"callOutName 写入之后 == %@",[[NSUserDefaults standardUserDefaults]stringForKey:@"callOutName"]);
}
@end
