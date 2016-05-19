//
//  ViewController.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "ViewController.h"
#import "YYButton.h"
#import "YYShowScrollView.h"
#import "YSTopScrview.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YYShowScrollView *showView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showView.alwaysBounceVertical = NO;
    self.showView.alwaysBounceHorizontal = NO;
    
    YSTopScrview *top = [[YSTopScrview alloc]init];
    top.frame = CGRectMake(0, 0, 500, 44);
    top.contentSize = CGSizeMake(500, 44);    
    [self.topView addSubview:top];
    
//    [self showViewInit];
}

@end
