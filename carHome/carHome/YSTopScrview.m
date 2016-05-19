//
//  YSTopScrview.m
//  百思不得01
//
//  Created by xmg on 16/5/19.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "YSTopScrview.h"

@interface YSTopScrview ()
@property (strong, nonatomic) NSArray *strArr;
///按钮数组
//@property(nonatomic, strong) NSMutableArray *btnArray;
//底部指示器
@property (weak, nonatomic) UIView *bottomView;
@end

@implementation YSTopScrview


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //按钮数组
        self.strArr = @[@"全部",@"视频",@"视频",@"视频",@"视频",@"图片",@"段子",@"声音",@"声音",@"声音",@"声音",@"声音",@"声音"];
        NSInteger count = [self.strArr count];
        for (NSInteger i = 0;i < count; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.tag = i;
            [btn setTitle:self.strArr[i] forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
        //底部指示器
        UIView *bottomView = [[UIView alloc]init];
        bottomView.backgroundColor = [UIColor redColor];
        [self addSubview:bottomView];
        self.bottomView = bottomView;
        //
        self.contentSize = CGSizeMake(count * (50 + 0), 30);
        self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
    }
    return self;
}

-(void)layoutSubviews{
    CGFloat w = 70;
    CGFloat h = 42;
    //按钮位置
    for(UIView *btn in self.subviews){
        if (![btn isKindOfClass:NSClassFromString(@"UIButton")]) continue;
        btn.frame = CGRectMake(btn.tag * w, 0, w, h);
        if (btn.tag == 0) {
            [self changeFrame:(id)btn];
        }
    }

}

-(void)clickBtn:(UIButton *)btn{

    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:10 initialSpringVelocity:50 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self changeFrame:btn];
        
    } completion:^(BOOL finished) {
    }];
}

//计算按钮位置
-(void)changeFrame:(UIButton *)btn{
    CGFloat w = btn.titleLabel.frame.size.width;
    CGFloat h = 2;
    CGFloat x = btn.frame.origin.x + btn.titleLabel.frame.origin.x;
    CGFloat y = CGRectGetMaxY(btn.frame);
    self.bottomView.frame = CGRectMake(x, y, w, h);
}
@end
