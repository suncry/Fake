//
//  CameraOverlayViewController.h
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraOverlayViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,retain)UIImagePickerController *pickerController;

@end
