//
//  CameraOverlayViewController.m
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CameraOverlayViewController.h"

@interface CameraOverlayViewController ()

@end

@implementation CameraOverlayViewController
@synthesize pickerController;
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
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"拍照背景图.jpg"]];
    backgroundImageView.frame = CGRectMake(0, 0, 320, [self.view bounds].size.height);
    [self.view addSubview:backgroundImageView];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(60, 300, 100, 50)];
    [btn setTitle:@"拍照" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self.pickerController action:@selector(takeThePic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(160, 300, 100, 50)];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"取消" forState:UIControlStateNormal];
    [btn2 addTarget:self.pickerController action:@selector(cancleTakeThePic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)takeThePic
{
    /**
     *  实际 执行的方法是 pickerController中得takeThePic 此方法并不执行
     */
    NSLog(@"CameraOverlayViewController    takePicture!!!");
//    [pickerController takePicture];
}
-(void)cancleTakeThePic
{
    /**
     *  实际 执行的方法是 pickerController中得takeThePic 此方法并不执行
     */
    //    NSLog(@"CameraOverlayViewController    takePicture!!!");
    //    [pickerController takePicture];
}

@end
