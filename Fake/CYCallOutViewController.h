//
//  CYCallOutViewController.h
//  Fake
//
//  Created by cy on 14-1-15.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CYCallOutViewController : UIViewController<UITextViewDelegate>
{
    IBOutlet UITextView *nameTextView;
    IBOutlet UILabel *nameLablePlaceHolder;
}
@property (nonatomic,retain)NSString *name;

- (IBAction)startCallOut:(id)sender;

@end
