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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YYShowScrollView *showView;

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
    self.showView.alwaysBounceVertical = NO;
    self.showView.alwaysBounceHorizontal = NO;
    
    [self showViewInit];
}



//初始化
- (void)showViewInit{
    //定义常量
    const CGFloat sVW = self.showView.frame.size.width;
    const CGFloat sVH = self.showView.frame.size.height;
    const int HorLen  = 4;   //水平长度,每一行的bnt数.
    const CGFloat space = 10; //间距
    const CGFloat btnH = 25;
    const CGFloat lebelH = 20;
    
    //计算btnW
    const CGFloat btnW = (sVW - space * (HorLen +1)) / HorLen;
    
    //设置topLable
    UILabel *topLable = [[UILabel alloc]initWithFrame:CGRectMake(space, space, sVW, lebelH)];
    topLable.font = [UIFont systemFontOfSize:14];
    topLable.text = @"已选频道:";
    self.topLabel = topLable;
    [self.showView addSubview:self.topLabel];
    
    //计算 top btn 的初始 Y
    const CGFloat initTY = CGRectGetMaxY(self.topLabel.frame) + space;
    
    //设置 '最新' btn
    CGFloat btnX = 0 % HorLen * (space + btnW) + space;
    CGFloat btnY = 0 / HorLen * (space + btnH) + initTY;
    YYButton *btn = [YYButton buttonWithString:@"最新" tag:0 frame:CGRectMake(btnX, btnY, btnW, btnH)];
    [btn setBackgroundColor:[UIColor clearColor]];
    [self.showView addSubview:btn];
    
    //设置btn
    [self.barArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //计算btn的x,y
        CGFloat btnX = (idx + 1) % HorLen * (space + btnW) + space;
        CGFloat btnY = (idx + 1) / HorLen * (space + btnH) + initTY;
        //创建btn
        YYButton *btn = [YYButton buttonWithString:(NSString *)obj tag:idx frame:CGRectMake(btnX, btnY, btnW, btnH)];
        [self.showView addSubview:btn];
        //绑定点击事件
        [btn addTarget:self action:@selector(barBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }];
    

    //计算 bottomLabel 的初始 Y
    const CGFloat initBLY = CGRectGetMaxY([self.showView.subviews.lastObject frame]) + space;
    
    //设置bottomLabel
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(space, initBLY, sVW, lebelH)];
    bottomLabel.font = [UIFont systemFontOfSize:14];
    bottomLabel.text = @"可选频道:";
    self.bottomLabel = bottomLabel;
    [self.showView addSubview:self.bottomLabel];
    
}


#pragma mark - 点击按钮
- (void)barBtnClick:(UIButton *)btn{
    NSLog(@"%s",__func__);
    
    
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
