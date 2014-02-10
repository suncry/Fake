//
//  CYStartPageViewController.h
//  Fake
//
//  Created by cy on 14-1-26.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYStartPageViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *startScrollView;
    UIButton *startBtn;
    UIPageControl *pageControl;
}
@end
