//
//  CYcallInIngViewController.h
//  Fake
//
//  Created by cy on 14-1-23.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CYcallInIngViewController : UIViewController
{
    IBOutlet UILabel *nameLable;
    IBOutlet UIImageView *backgroundImgView;
}
@property(nonatomic,retain)AVAudioPlayer *ring;

- (IBAction)takePhone:(id)sender;
- (IBAction)back:(id)sender;


@end
