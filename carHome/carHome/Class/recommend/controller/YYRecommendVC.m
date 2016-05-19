//
//  YYRecommendVC.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYRecommendVC.h"
#import "YYNavTitleView.h"
#import "YSTopScrview.h"

@interface YYRecommendVC ()

@end

@implementation YYRecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    YYNavTitleView *topView = [[[NSBundle mainBundle] loadNibNamed:@"YYNavTitleView" owner:nil options:nil] lastObject]; ;
    topView.frame = CGRectMake(0, 20, 375, 44);
    [self.view addSubview:topView];
    
    topView.topScrollView.strArr = @[@"全部12123",@"视5451",@"视频54654642",@"视4频3",@"视频4",@"图片5",@"段子6",@"声音7",@"声音",@"声音"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
