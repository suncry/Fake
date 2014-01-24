//
//  CYFeedBackViewController.h
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYFeedBackViewController : UIViewController<UITextViewDelegate>
{
    IBOutlet UILabel *_emailLable;//用于显示"你的邮箱/电话"
    IBOutlet UITextView *_emailTextView;
    IBOutlet UITextView *_commentTextView;

}
- (IBAction)sendFeedBack:(id)sender;
@end
