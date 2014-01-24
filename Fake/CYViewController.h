//
//  CYViewController.h
//  Fake
//
//  Created by cy on 14-1-8.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYViewController : UIViewController
{
    IBOutlet UIImageView *callIn;
    IBOutlet UIImageView *callOut;
    IBOutlet UIImageView *takePic;
    IBOutlet UIImageView *ring_callIn;
    IBOutlet UIImageView *ring_callOut;
    IBOutlet UIImageView *ring_takePic;
    IBOutlet UIButton *callOutBtn;
    IBOutlet UIButton *callinBtn;
    IBOutlet UIButton *takePicBtn;

}
- (IBAction)takePicture:(id)sender;
- (IBAction)call:(id)sender;
- (IBAction)takePhone:(id)sender;
@end
