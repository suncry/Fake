//
//  CYViewController.h
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,retain)UIImagePickerController *picker;

- (IBAction)takePicture:(id)sender;

@end
