//
//  YYShowScrollView.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYShowScrollView.h"
#import "YYButton.h"

@interface YYShowScrollView ()
/// topLabel
@property(nonatomic, weak) UILabel *topLabel;
/// bottomLabel
@property(nonatomic, weak) UILabel *bottomLabel;

/// 全部的类型(NSString) 数组
@property(nonatomic, strong) NSArray *barArray;
/// topBar(UIButton) 数组
@property(nonatomic, strong) NSMutableArray *topBarArr;
/// bottomBar(UIButton) 数组
@property(nonatomic, strong) NSMutableArray *bottomBarArr;
@end

@implementation YYShowScrollView

- (void)awakeFromNib{
    [self showViewInit];
}


-(void)layoutSubviews{
    [super layoutSubviews];

}


//初始化
- (void)showViewInit{
    
    //定义常量
    const CGFloat sVW = self.frame.size.width;
//    const CGFloat sVH = self.frame.size.height;
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
    [self addSubview:self.topLabel];
    
    //计算 top btn 的初始 Y
    const CGFloat initTY = CGRectGetMaxY(self.topLabel.frame) + space;
    
    //设置 '最新' btn
    CGFloat btnX = 0 % HorLen * (space + btnW) + space;
    CGFloat btnY = 0 / HorLen * (space + btnH) + initTY;
    YYButton *btn = [YYButton buttonWithString:@"最新" tag:0 frame:CGRectMake(btnX, btnY, btnW, btnH)];
    
    [btn setBackgroundColor:[UIColor clearColor]];
    [self addSubview:btn];
    
    //设置btn
    [self.barArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //计算btn的x,y
        CGFloat btnX = (idx + 1) % HorLen * (space + btnW) + space;
        CGFloat btnY = (idx + 1) / HorLen * (space + btnH) + initTY;
        //创建btn
        YYButton *btn = [YYButton buttonWithString:(NSString *)obj tag:idx frame:CGRectMake(btnX, btnY, btnW, btnH)];
        //        NSLog(@"%@",btn);
        [self.topBarArr addObject:btn];
        [self addSubview:btn];
        //绑定点击事件
        [btn addTarget:self action:@selector(barBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    
    //计算 bottomLabel 的初始 Y
    const CGFloat initBLY = CGRectGetMaxY([self.subviews.lastObject frame]) + space;
    
    //设置bottomLabel
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(space, initBLY, sVW, lebelH)];
    bottomLabel.font = [UIFont systemFontOfSize:14];
    bottomLabel.text = @"可选频道:";
    self.bottomLabel = bottomLabel;
    [self addSubview:self.bottomLabel];
    
}

#pragma mark - 点击按钮
- (void)barBtnClick:(YYButton *)btn{
    
    if (btn.isTop) {
        //在 top,需要移动到 bottom
        //从top数组中移除, 加入到bottom数组中
        //从top中移除
        btn.status = NO;
        __weak NSMutableArray *topBarArr = self.topBarArr;
        [topBarArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = [[(YYButton *)obj titleLabel] text];
            if ([str isEqualToString:btn.titleLabel.text]) {
                [topBarArr removeObjectAtIndex:idx];
                *stop = YES;
            }
        }];
//        NSLog(@"topBarArr -- %@",self.topBarArr);
        //加入到bottom
        [self.bottomBarArr addObject:btn];
//        NSLog(@"bottomBarArr--%@",self.bottomBarArr);
        //布局
        //[self.showView setNeedsLayout];
        [self layoutShowView];
        
        
    }else{
        //在 bottom,需要移动到 top
        //从bottom数组中移除, 加入到top数组中
        //从bottom中移除
        btn.status = YES;
        __weak NSMutableArray *topBarArr = self.bottomBarArr;
        [topBarArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = [[(YYButton *)obj titleLabel] text];
            if ([str isEqualToString:btn.titleLabel.text]) {
                [topBarArr removeObjectAtIndex:idx];
                *stop = YES;
            }
        }];
//        NSLog(@"bottomBarArr-  -%@",self.bottomBarArr);
        //加入到top
        [self.topBarArr addObject:btn];
//        NSLog(@"topBarArr-  -%@",self.topBarArr);
        //布局
        //        [self.showView setNeedsLayout];
        [self layoutShowView];
    }
}


#pragma mark - 布局ScrollView
- (void)layoutShowView{
    
    [UIView animateWithDuration:0.25 animations:^{
        //定义常量
        const CGFloat sVW = self.frame.size.width;
//        const CGFloat sVH = self.frame.size.height;
        const int HorLen  = 4;   //水平长度,每一行的bnt数.
        const CGFloat space = 10; //间距
        const CGFloat btnH = 25;
//        const CGFloat lebelH = 20;
        
        //计算btnW
        const CGFloat btnW = (sVW - space * (HorLen +1)) / HorLen;
        
        //计算 top btn 的初始 Y
        const CGFloat initTY = CGRectGetMaxY(self.topLabel.frame) + space;
        
        //设置topBarArr
        [self.topBarArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //        NSLog(@"obj = %@",obj);
            //计算btn的x,y
            CGFloat btnX = (idx + 1) % HorLen * (space + btnW) + space;
            CGFloat btnY = (idx + 1) / HorLen * (space + btnH) + initTY;
            //重新布局btn
            YYButton *btn = (YYButton *)obj;
            CGRect btnFrame = btn.frame;
            btnFrame.origin.x = btnX;
            btnFrame.origin.y = btnY;
            btn.frame = btnFrame;
//            NSLog(@"btn = %@ \n str = %@", btn ,btn.titleLabel.text);
        }];
        
        
        NSInteger cuont = self.topBarArr.count;
        const CGFloat initBLY = CGRectGetMaxY(self.topLabel.frame) + (((cuont / HorLen) + 1) * (space + btnH)) +space;
        
        //重新布局bottomLabel
        CGRect bottomLabelFrame = self.bottomLabel.frame;
        bottomLabelFrame.origin.y = initBLY;
        self.bottomLabel.frame = bottomLabelFrame;
//        NSLog(@"initBLY = %f,cuont = %li",initBLY,cuont);
//        NSLog(@"bottomLabel.frame = %@", NSStringFromCGRect(bottomLabelFrame));
        
        
        //计算 bottom btn 的初始 Y
        const CGFloat initBY = CGRectGetMaxY(self.bottomLabel.frame) + space;
        
        //设置bottomBarArr
        [self.bottomBarArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            //计算btn的x,y
            CGFloat btnX = (idx) % HorLen * (space + btnW) + space;
            CGFloat btnY = (idx) / HorLen * (space + btnH) + initBY;
            //重新布局btn
            YYButton *btn = (YYButton *)obj;
            CGRect btnFrame = btn.frame;
            btnFrame.origin.x = btnX;
            btnFrame.origin.y = btnY;
            btn.frame = btnFrame;
//            NSLog(@"btn.frame = %@", NSStringFromCGRect(btn.frame));
        }];
        
    }];
}

#pragma mark - lize

-(NSMutableArray *)topBarArr{
    if(_topBarArr == nil){
        
        _topBarArr = [NSMutableArray array];
    }
    return _topBarArr;
}

-(NSArray *)bottomBarArr{
    if(_bottomBarArr == nil){
        
        _bottomBarArr = [NSMutableArray array];
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
