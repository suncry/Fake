//
//  CYStartPageViewController.m
//  Fake
//
//  Created by cy on 14-1-26.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYStartPageViewController.h"

@interface CYStartPageViewController ()

@end

@implementation CYStartPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

    
    if ([self.view bounds].size.height < 568)
    {
        startBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, 420, 250, 35)];

        if (IOS_VERSION_7_OR_ABOVE)
        {
            startBtn.frame = CGRectMake(35, 420, 250, 50);

        } else
        {

        }

        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        startBtn.backgroundColor = [UIColor colorWithRed:180/255.0f green:129/255.0f blue:255/255.0f alpha:1.0f];
        [startBtn setTitle:@"开始假装" forState:UIControlStateNormal];
        startBtn.layer.masksToBounds = YES;
        startBtn.layer.cornerRadius = 5;
        [self.view addSubview:startBtn];
        
        startScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 414)];
        startScrollView.contentSize = CGSizeMake(320*4, 414) ;

    }
    else
    {
        startBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, 495, 250, 50)];
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [startBtn setTitle:@"开始假装" forState:UIControlStateNormal];

        startBtn.backgroundColor = [UIColor colorWithRed:180/255.0f green:129/255.0f blue:255/255.0f alpha:1.0f];

        startBtn.layer.masksToBounds = YES;

        startBtn.layer.cornerRadius = 5;
        [self.view addSubview:startBtn];

        startScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 468)];
        startScrollView.contentSize = CGSizeMake(320*4, 468) ;

    }
    startScrollView.delegate = self;
    startScrollView.showsVerticalScrollIndicator = NO;
    startScrollView.showsHorizontalScrollIndicator = NO;
    startScrollView.bounces = NO;
    startScrollView.pagingEnabled = YES;
    [self.view addSubview:startScrollView];
    
    if ([self.view bounds].size.height < 568)
    {
        UIImageView *startImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 414)];
        [startImg1 setImage:[UIImage imageNamed:@"引导01_960"]];
        UIImageView *startImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 320, 414)];
        [startImg2 setImage:[UIImage imageNamed:@"引导02_960"]];
        UIImageView *startImg3 = [[UIImageView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 414)];
        [startImg3 setImage:[UIImage imageNamed:@"引导03_960"]];
        UIImageView *startImg4 = [[UIImageView alloc]initWithFrame:CGRectMake(320*3, 0, 320, 414)];
        [startImg4 setImage:[UIImage imageNamed:@"引导04_960"]];
        [startScrollView addSubview:startImg1];
        [startScrollView addSubview:startImg2];
        [startScrollView addSubview:startImg3];
        [startScrollView addSubview:startImg4];

        
    }
    else
    {
        UIImageView *startImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 468)];
        [startImg1 setImage:[UIImage imageNamed:@"引导01"]];
        UIImageView *startImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 320, 468)];
        [startImg2 setImage:[UIImage imageNamed:@"引导02"]];
        UIImageView *startImg3 = [[UIImageView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 468)];
        [startImg3 setImage:[UIImage imageNamed:@"引导03"]];
        UIImageView *startImg4 = [[UIImageView alloc]initWithFrame:CGRectMake(320*3, 0, 320, 468)];
        [startImg4 setImage:[UIImage imageNamed:@"引导04"]];
        [startScrollView addSubview:startImg1];
        [startScrollView addSubview:startImg2];
        [startScrollView addSubview:startImg3];
        [startScrollView addSubview:startImg4];

        
    }


    
    
    //定义PageControll
    
    pageControl = [[UIPageControl alloc] init];
    
    if ([self.view bounds].size.height < 568)
    {
        pageControl.frame = CGRectMake(150, 390, 20, 20);//指定位置大小

    }
    else
    {
        pageControl.frame = CGRectMake(150, 450, 20, 20);//指定位置大小
    }

    
    pageControl.numberOfPages = 4;//指定页面个数
    
    pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
    
    [pageControl addTarget:self action:@selector(changePage)forControlEvents:UIControlEventValueChanged];
    //添加委托方法，当点击小白点就执行此方法
    
    [self.view addSubview:pageControl];
    

    
    
}
//scrollview的委托方法，当滚动时执行

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    int page = startScrollView.contentOffset.x / 290;//通过滚动的偏移量来判断目前页面所对应的小白点
    
    pageControl.currentPage = page;//pagecontroll响应值的变化
    
}
//pagecontroll的委托方法

- (void)changePage
{
    
    int page = pageControl.currentPage;//获取当前pagecontroll的值
    
    [startScrollView setContentOffset:CGPointMake(300 * page, 0)];//根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)start
{
    [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"NotFrist"];
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyBoard instantiateInitialViewController] animated:YES completion:nil];

}
@end
