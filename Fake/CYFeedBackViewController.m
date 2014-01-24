//
//  CYFeedBackViewController.m
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYFeedBackViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"

@interface CYFeedBackViewController ()

@end

@implementation CYFeedBackViewController

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
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //禁止换行...实现 done 按钮
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    
    return YES;
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        _emailLable.text = @"你的邮箱/电话";
    }
    else
    {
        _emailLable.text = @"";
    }
}
- (IBAction)sendFeedBack:(id)sender
{
    if (_commentTextView.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@">_<!" message:@"反馈内容不能为空哦!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        // optional - add more buttons:
        //        [alert addButtonWithTitle:@"Yes"];
        [alert show];
    }
    else
    {
        //发送 反馈信息
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.ipointek.com/feedback/api/feedback"]];
        //@"http://www.ipointek.com/feedback/api/feedback
        //    post 方式
        //    appid = 1014
        //    content = 内容
        //    os_version = 系统版本
        //    client_version = 客户端版本
        //    email = 邮箱
        NSString *osVersion =[[ UIDevice currentDevice]systemVersion];
        NSString *osModel = [[ UIDevice currentDevice]model];
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *clientVersion =  [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *bundleNum = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];
        
        ASIFormDataRequest *requestForm = [ASIFormDataRequest requestWithURL:url];
        [requestForm setPostValue:@"1014" forKey:@"appid"];
        [requestForm setPostValue:_emailTextView.text forKey:@"email"];
        [requestForm setPostValue:_commentTextView.text forKey:@"content"];
        [requestForm setPostValue:[NSString stringWithFormat:@"iOS %@ Model:%@",osVersion,osModel] forKey:@"os_version"];
        [requestForm setPostValue:[NSString stringWithFormat:@"Client v%@ Build:%@",clientVersion,bundleNum] forKey:@"client_version"];
        __block ASIFormDataRequest *requestFormBlock = requestForm;
        [requestForm setCompletionBlock :^{
            NSString *commentString = [requestFormBlock responseString];
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSMutableDictionary *dict = [jsonParser objectWithString:commentString];
            NSLog(@"commentSend dict == %@",dict);
        }];
        [requestForm setFailedBlock :^{
            // 请求响应失败，返回错误信息
            NSError *error = [requestFormBlock error ];
            NSLog ( @"error:%@" ,[error userInfo ]);
        }];
        [requestForm startAsynchronous];
        
    }

    [self.navigationController popViewControllerAnimated:YES];
}

@end
