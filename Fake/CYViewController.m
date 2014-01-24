//
//  CYViewController.m
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYViewController.h"
#import "CYUIImagePickerController.h"
#import "CYAppDelegate.h"

@interface CYViewController ()
@end

@implementation CYViewController
-(void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupMenuButton];
    [self startAnimation];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePicture:(id)sender {
    CYUIImagePickerController *myPicker = [[CYUIImagePickerController alloc]init];
    [self presentViewController:myPicker animated:YES completion:nil];
}
-(void)setupMenuButton{
    //设置标题
    UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    t.font = [UIFont systemFontOfSize:17];
    t.textColor = [UIColor whiteColor];
    t.backgroundColor = [UIColor clearColor];
    t.textAlignment = NSTextAlignmentCenter;
    t.text = @"假装";
    self.navigationItem.titleView = t;
    
    if (IOS_VERSION_7_OR_ABOVE) {
        NSLog(@"IOS_VERSION_7_OR_ABOVE");
//        //左按钮
//        UIBarButtonItem *leftDrawerButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MainView_ setting"] style:UIBarButtonItemStylePlain target:self action:@selector(leftDrawerButtonPress:)];
//        [leftDrawerButton setTintColor:[UIColor whiteColor]];
//        self.navigationItem.leftBarButtonItem = leftDrawerButton;
//        //右按钮
//        UIBarButtonItem *rightDrawerButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MainView_ self"] style:UIBarButtonItemStylePlain target:self action:@selector(rightDrawerButtonPress:)];
//        [rightDrawerButton setTintColor:[UIColor whiteColor]];
//        self.navigationItem.rightBarButtonItem = rightDrawerButton;
//        
//        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:249/255.0f green:201/255.0f blue:12/255.0f alpha:1.0f]];
//        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        
    } else {
        NSLog(@"NOT IOS_VERSION_7_OR_ABOVE");
    }
    
    
}
- (IBAction)call:(id)sender
{
//    self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
//    [self performSegueWithIdentifier:@"call" sender:nil];
}
- (IBAction)takePhone:(id)sender
{
    
}
//动画
- (void)startAnimation1
{
    //为后面的动画做准备
    callinBtn.frame = CGRectMake(320, callinBtn.frame.origin.y, 75, 30);

    takePicBtn.frame = CGRectMake(320, takePicBtn.frame.origin.y, 75, 30);

    
    ring_callOut.image = [UIImage imageNamed:@"ring_1@2x"];
    CABasicAnimation *animationRotation_z = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animationRotation_z setFromValue:0];
    [animationRotation_z setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_z setDuration:0.5];
    [animationRotation_z setRepeatCount:2];
    //    [animation2 setAutoreverses:YES];
    [ring_callOut.layer addAnimation:animationRotation_z forKey:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeRing2_ring_callOut) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(changeRing3_ring_callOut) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeRing4_ring_callOut) userInfo:nil repeats:NO];
    
    CABasicAnimation *animationScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animationScale setFromValue:[NSNumber numberWithFloat: 1.0]];
    [animationScale setToValue:[NSNumber numberWithFloat: 2.0]];
    [animationScale setDuration:0.5];
    //         [animation2 setRepeatCount:MAXFLOAT];
    [animationScale setRepeatCount:1];
    [animationScale setAutoreverses:YES];
    [callOut.layer addAnimation:animationScale forKey:nil];
    
    
    CABasicAnimation *animationRotation_y = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [animationRotation_y setFromValue:0];
    [animationRotation_y setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_y setDuration:2.0];
    [animationRotation_y setRepeatCount:1];
    //    [animation2 setAutoreverses:YES];
    [callOut.layer addAnimation:animationRotation_y forKey:nil];

    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(){
        callOutBtn.frame = CGRectMake(320, callOutBtn.frame.origin.y, 75, 30);
        callOutBtn.frame = CGRectMake(170, callOutBtn.frame.origin.y, 75, 30);
    } completion:^(BOOL finished)
     {
     }];

}
//动画
- (void)startAnimation2
{
    ring_callIn.image = [UIImage imageNamed:@"ring_1@2x"];
    CABasicAnimation *animationRotation_z = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animationRotation_z setFromValue:0];
    [animationRotation_z setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_z setDuration:0.5];
    [animationRotation_z setRepeatCount:2];
    //    [animation2 setAutoreverses:YES];
    [ring_callIn.layer addAnimation:animationRotation_z forKey:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeRing2_ring_callIn) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(changeRing3_ring_callIn) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeRing4_ring_callIn) userInfo:nil repeats:NO];
    
    CABasicAnimation *animationScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animationScale setFromValue:[NSNumber numberWithFloat: 1.0]];
    [animationScale setToValue:[NSNumber numberWithFloat: 2.0]];
    [animationScale setDuration:0.5];
    //         [animation2 setRepeatCount:MAXFLOAT];
    [animationScale setRepeatCount:1];
    [animationScale setAutoreverses:YES];
    [callIn.layer addAnimation:animationScale forKey:nil];
    
    
    CABasicAnimation *animationRotation_y = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [animationRotation_y setFromValue:0];
    [animationRotation_y setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_y setDuration:2.0];
    [animationRotation_y setRepeatCount:1];
    //    [animation2 setAutoreverses:YES];
    [callIn.layer addAnimation:animationRotation_y forKey:nil];
    
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(){
        callinBtn.frame = CGRectMake(320, callinBtn.frame.origin.y, 75, 30);
        callinBtn.frame = CGRectMake(170, callinBtn.frame.origin.y, 75, 30);
    } completion:^(BOOL finished)
     {
     }];
    
}
//动画
- (void)startAnimation3
{
    ring_takePic.image = [UIImage imageNamed:@"ring_1@2x"];
    CABasicAnimation *animationRotation_z = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animationRotation_z setFromValue:0];
    [animationRotation_z setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_z setDuration:0.5];
    [animationRotation_z setRepeatCount:2];
    //    [animation2 setAutoreverses:YES];
    [ring_takePic.layer addAnimation:animationRotation_z forKey:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeRing2_ring_takePic) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(changeRing3_ring_takePic) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeRing4_ring_takePic) userInfo:nil repeats:NO];
    
    CABasicAnimation *animationScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animationScale setFromValue:[NSNumber numberWithFloat: 1.0]];
    [animationScale setToValue:[NSNumber numberWithFloat: 2.0]];
    [animationScale setDuration:0.5];
    //         [animation2 setRepeatCount:MAXFLOAT];
    [animationScale setRepeatCount:1];
    [animationScale setAutoreverses:YES];
    [takePic.layer addAnimation:animationScale forKey:nil];
    
    
    CABasicAnimation *animationRotation_y = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [animationRotation_y setFromValue:0];
    [animationRotation_y setToValue:[NSNumber numberWithFloat: M_PI * 4.0 ]];
    [animationRotation_y setDuration:2.0];
    [animationRotation_y setRepeatCount:1];
    //    [animation2 setAutoreverses:YES];
    [takePic.layer addAnimation:animationRotation_y forKey:nil];
    
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(){
        takePicBtn.frame = CGRectMake(320, takePicBtn.frame.origin.y, 75, 30);
        takePicBtn.frame = CGRectMake(170, takePicBtn.frame.origin.y, 75, 30);
        
    } completion:^(BOOL finished)
     {
     }];
    
}
- (void)changeRing2_ring_callOut
{
    ring_callOut.image = [UIImage imageNamed:@"ring_2@2x"];
}
- (void)changeRing3_ring_callOut
{
    ring_callOut.image = [UIImage imageNamed:@"ring_3@2x"];
}
- (void)changeRing4_ring_callOut
{
    ring_callOut.image = [UIImage imageNamed:@"ring_4@2x"];
}
- (void)changeRing2_ring_callIn
{
    ring_callIn.image = [UIImage imageNamed:@"ring_2@2x"];
}
- (void)changeRing3_ring_callIn
{
    ring_callIn.image = [UIImage imageNamed:@"ring_3@2x"];
}
- (void)changeRing4_ring_callIn
{
    ring_callIn.image = [UIImage imageNamed:@"ring_4@2x"];
}
- (void)changeRing2_ring_takePic
{
    ring_takePic.image = [UIImage imageNamed:@"ring_2@2x"];
}
- (void)changeRing3_ring_takePic
{
    ring_takePic.image = [UIImage imageNamed:@"ring_3@2x"];
}
- (void)changeRing4_ring_takePic
{
    ring_takePic.image = [UIImage imageNamed:@"ring_4@2x"];
}
- (void)startAnimation
{
    [self startAnimation1];
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(startAnimation2) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startAnimation3) userInfo:nil repeats:NO];

}
@end
