//
//  CYViewController.m
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYViewController.h"
#import "CameraOverlayViewController.h"
@interface CYViewController ()
@end

@implementation CYViewController
@synthesize picker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePicture:(id)sender {
    self.picker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.picker.showsCameraControls = NO;
        self.picker.allowsEditing = YES;
        CameraOverlayViewController *cameraViewController = [[CameraOverlayViewController alloc]init];
        self.picker.cameraOverlayView = cameraViewController.view;
        cameraViewController.pickerController = picker;
        //改为后置摄像头
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        self.picker.mediaTypes = temp_MediaTypes;
        self.picker.delegate = self;
    }
    [self presentViewController:self.picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    // Save the image to the album
    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
    NSLog(@"完成了拍照!");
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消了拍照!");
}

-(void)takeThePic
{
    [self.picker takePicture];
}
-(void)cancleTakeThePic
{
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}

@end
