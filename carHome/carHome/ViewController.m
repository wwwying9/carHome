//
//  ViewController.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *showView;

/// topLabel
@property(nonatomic, weak) UILabel *topLabel;
/// bottomLabel
@property(nonatomic, weak) UILabel *bottomLabel;

/// 全部的类型 数组
@property(nonatomic, strong) NSArray *barArray;
/// topBar 数组
@property(nonatomic, strong) NSArray *topBarArr;
/// bottomBar 数组
@property(nonatomic, strong) NSArray *bottomBarArr;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showViewInit];
}

//初始化
- (void)showViewInit{
    //定义常量
    const CGFloat sVW = self.showView.frame.size.width;
    const CGFloat sVH = self.showView.frame.size.height;
    const int HorLen  = 4;   //水平长度,每一行的bnt数.
    const CGFloat space = 10; //间距
    const CGFloat btnH = 30;
    
    //计算btnW
    const CGFloat btnW = (sVW - space * (HorLen +1)) / HorLen;
    
    //设置topLable
    UILabel *topLable = [[UILabel alloc]initWithFrame:CGRectMake(space, space, sVW, btnH)];
    topLable.text = @"已选频道:";
    self.topLabel = topLable;
    [self.showView addSubview:self.topLabel];
    
    
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(space, space, sVW, btnH)];
    bottomLabel.text = @"可选频道:";
    self.bottomLabel = bottomLabel;
    [self.showView addSubview:self.bottomLabel];
    
}



#pragma mark - lize

-(NSArray *)topBarArr{
    if(_topBarArr == nil){
        
        _topBarArr = [NSArray array];
    }
    return _topBarArr;
}

-(NSArray *)bottomBarArr{
    if(_bottomBarArr == nil){
        
        _bottomBarArr = [NSArray array];
    }
    return _bottomBarArr;
}

-(NSArray *)barArray{
    
    if(_barArray == nil){
        _barArray = @[
                      @"文化",
                      @"视频",
                      @"用车",
                      @"快报",
                      @"优创+",
                      @"原创视频",
                      @"说客",
                      @"新闻",
                      @"改装",
                      @"导购",
                      @"游记",
                      @"行情",
                      @"评测",
                      @"技术",
                     ];;
    }
    return _barArray;
}

@end
