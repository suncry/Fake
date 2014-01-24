//
//  CYAppTopViewController.h
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYAppTopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *_recommendationAppTable;

}
@property (nonatomic, retain) NSMutableArray *appDatas;

@end
