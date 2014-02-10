//
//  CYTakePhoneViewController.h
//  Fake
//
//  Created by cy on 14-1-14.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYTakePhoneViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDelegate>
{
    IBOutlet UIPickerView *timePicker;
    IBOutlet UITextView *nameTextView;
    IBOutlet UILabel *nameLablePlaceHolder;
    IBOutlet UIButton *startBtn;
    //来电时间
    int min;
}
- (IBAction)okBtnClick:(id)sender;
@end
