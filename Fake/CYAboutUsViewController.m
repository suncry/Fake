//
//  CYAboutUsViewController.m
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYAboutUsViewController.h"

@interface CYAboutUsViewController ()

@end

@implementation CYAboutUsViewController

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
    if ([self.view bounds].size.height < 568)
    {
        [_backgroundImgView setImage:[UIImage imageNamed:@"关于我们960"]];
    }
    
    
    self.visonLable = [[UILabel alloc]initWithFrame:CGRectMake(0, [self.view bounds].size.height - 100, 320, 20)];

    self.visonLable.backgroundColor = [UIColor clearColor];
    self.visonLable.textAlignment = NSTextAlignmentCenter;
    self.visonLable.textColor = [UIColor lightGrayColor];
    self.visonLable.font = [UIFont systemFontOfSize:14.0f];
    NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
    float softVerson =[[infoDict objectForKey:@"CFBundleShortVersionString"] floatValue];
//    self.visonLable.text = [NSString stringWithFormat:@"当前版本:%f",softVerson];
    [self.visonLable setText:[NSString stringWithFormat:@"当前版本:%0.1f",softVerson]];
    NSLog(@"softVerson == %f",softVerson);
    [self.view addSubview:self.visonLable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
