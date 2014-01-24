//
//  CYUIImagePickerController.m
//  Fake
//
//  Created by cy on 14-1-14.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYUIImagePickerController.h"

@interface CYUIImagePickerController ()

@end

@implementation CYUIImagePickerController

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
    //覆盖的VIEW
    UIView * myCameraOverlayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, [self.view bounds].size.height)];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"浏览器页面"]];
    backgroundImageView.frame = CGRectMake(0, 0, 320, [self.view bounds].size.height);
    [myCameraOverlayView addSubview:backgroundImageView];
    
    myCameraOverlayView.backgroundColor = [UIColor blackColor];
    
    //返回按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, [self.view bounds].size.height - 50, 100, 50)];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(cancleTakeThePic) forControlEvents:UIControlEventTouchUpInside];
    [myCameraOverlayView addSubview:btn];
    
    //拍照按钮
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, [self.view bounds].size.height - 50, 220, 50)];
    btn2.backgroundColor = [UIColor clearColor];
    [btn2 addTarget:self action:@selector(takeThePic) forControlEvents:UIControlEventTouchUpInside];
    [myCameraOverlayView addSubview:btn2];

    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.showsCameraControls = NO;
        self.allowsEditing = YES;
        self.cameraOverlayView = myCameraOverlayView;
        //改为后置摄像头
        self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.sourceType];
        self.mediaTypes = temp_MediaTypes;
        self.delegate = self;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    // Save the image to the album
    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
    NSLog(@"CYUIImagePickerController完成了拍照!");
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"CYUIImagePickerController取消了拍照!");
}

-(void)takeThePic
{
    NSLog(@"CYUIImagePickerController拍照!");
    [self takePicture];
}
-(void)cancleTakeThePic
{
    NSLog(@"CYUIImagePickerController取消拍照!");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
