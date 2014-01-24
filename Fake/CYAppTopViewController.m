//
//  CYAppTopViewController.m
//  Fake
//
//  Created by cy on 14-1-24.
//  Copyright (c) 2014年 cy. All rights reserved.
//

#import "CYAppTopViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"
#import "RecommendationAPPCell.h"
#import "UIImageView+WebCache.h"
@interface CYAppTopViewController ()

@end

@implementation CYAppTopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self getAppInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //    if ([_appDatas retainCount] == 1) {
    //        [_appDatas retain];
    //    }
    //    NSLog(@"self.appDatas == %@",self.appDatas);
    return [self.appDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecommendationAPPCell";
    RecommendationAPPCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[RecommendationAPPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //config the cell
    NSDictionary *appdata = [self.appDatas objectAtIndex:indexPath.row];
    //    NSLog(@"appdata == %@",appdata);
    cell.appNameLable.text = [appdata objectForKey:@"trackName"];
    cell.appInfoLable.text = [appdata objectForKey:@"description"];
    [cell.downloadBtn addTarget:self action:@selector(downloadApp:) forControlEvents:UIControlEventTouchUpInside];
    cell.appImageView.layer.masksToBounds = YES; //没这句话它圆不起来
    cell.appImageView.layer.cornerRadius = 5.0; //设置图片圆角的尺度。
    [cell.appImageView setImageWithURL:[NSURL URLWithString:[appdata objectForKey:@"artworkUrl60"]] placeholderImage:[UIImage imageNamed:@"defineAPPImage.png"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 80;
}
- (void)downloadApp:(id)sender
{
    UITableViewCell *cell = (UITableViewCell*)[[sender superview]superview];
    NSInteger index = [_recommendationAppTable indexPathForCell:cell].row;
    NSString *_idStr = [NSString stringWithFormat:@"%@",[[self.appDatas objectAtIndex:index] objectForKey:@"trackViewUrl"]];
    
    //    NSLog(@"_idStr == %@",_idStr);
    //跳转到应用页面
    //    NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%d",appid];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_idStr]];
    
    
}

- (void)getAppInfo
{
    self.appDatas = [[NSMutableArray alloc]initWithCapacity:3];
    //假装的ID 为 1014
    NSString *urlString2 = @"http://www.ipointek.com/feedback/api/apps/recommend?appid=1014&platform=ios";
    NSURL *url2 = [NSURL URLWithString:[urlString2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url2];
    __block ASIHTTPRequest *requestBlock = request;
    [request setCompletionBlock :^{
        NSString *appString = [requestBlock responseString];
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *appDict = [jsonParser objectWithString:appString];
        if (appDict && [[appDict objectForKey:@"status"] integerValue] == 200) {
            //            NSLog(@"应用推荐 获取到了应用信息！");
            NSArray *appsArray = [NSArray arrayWithArray:[appDict objectForKey:@"data"]];
            NSMutableString *appsUrl = [[NSMutableString alloc]initWithCapacity:0];
            [appsUrl appendString:@"https://itunes.apple.com/cn/lookup?id="];
            int count = [appsArray count];
            //            NSLog(@"count == %d",count);
            if (count > 0) {
                for (int i = 0; i < count; i++) {
                    [appsUrl appendString:[[appsArray objectAtIndex:i] objectForKey:@"ios_appid"]];
                    if (i!= count-1) {
                        [appsUrl appendString:@","];
                    }
                }
                NSURL *appUrl = [NSURL URLWithString:[appsUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                NSLog(@"要搜去APP信息的地址为appUrl === %@",appUrl);
                ASIHTTPRequest *request2 = [ASIHTTPRequest requestWithURL:appUrl];
                __block ASIHTTPRequest *requestBlock2 = request2;
                [request2 setCompletionBlock :^{
                    //                    NSData *appInfoData = [requestBlock2 responseData];
                    NSString *appInfoString = [requestBlock2 responseString];
                    NSLog(@"appInfoString == %@",appInfoString);
                    //                    [appInfoString dataUsingEncoding:NSASCIIStringEncoding];
                    //                    NSLog(@"[appInfoString dataUsingEncoding:NSASCIIStringEncoding] == %@",[appInfoString dataUsingEncoding:NSASCIIStringEncoding]);
                    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
                    NSMutableDictionary *appInfoDict = [jsonParser objectWithString:appInfoString];
                    
                    
                    NSLog(@"appInfoDict == %@",appInfoDict);
                    
                    if (appInfoDict && [[appInfoDict objectForKey:@"resultCount"] integerValue] != 0)
                    {
                        [self.appDatas addObjectsFromArray:[appInfoDict objectForKey:@"results"]];
                        [_recommendationAppTable reloadData];
                        
                        NSLog(@"_recommendationAppTable 刷新了");
                    }
                    
                }];
                [request2 setFailedBlock :^{
                    // 请求响应失败，返回错误信息
                    NSError *error = [requestBlock error ];
                    NSLog ( @"appinfo出错:%@" ,[error userInfo ]);
                }];
                [request2 startAsynchronous];
            }
        }
    }];
    [request setFailedBlock :^{
        // 请求响应失败，返回错误信息
        NSError *error = [requestBlock error ];
        NSLog ( @"推荐app信息下载出错:%@" ,[error userInfo ]);
    }];
    [request startAsynchronous];

}
@end
