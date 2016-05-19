//
//  YSTopScrview.m
//  百思不得01
//
//  Created by xmg on 16/5/19.
//  Copyright © 2016年 YS. All rights reserved.
//

#import "YSTopScrview.h"
#define XMGNameFont [UIFont systemFontOfSize:16]


@interface YSTopScrview ()
///按钮数组
//@property(nonatomic, strong) NSMutableArray *btnArray;
//底部指示器
@property (weak, nonatomic) UIView *bottomView;
@end

@implementation YSTopScrview


-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
    NSLog(@"%s",__func__);
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    //底部指示器
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor redColor];
    [self addSubview:bottomView];
    self.bottomView = bottomView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)clickBtn:(UIButton *)btn{

    CGFloat w = btn.titleLabel.frame.size.width;
    CGFloat h = 2;
    CGFloat x = btn.frame.origin.x + btn.titleLabel.frame.origin.x;
    CGFloat y = CGRectGetMaxY(btn.frame);
    
    if ((x > self.contentOffset.x + 9 ) && (x < self.contentOffset.x + self.frame.size.width -  w) ) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:10 initialSpringVelocity:50 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.bottomView.frame = CGRectMake(x, y, w, h);
            NSLog(@"x = %f w = %f contentOffset.x = %f ",x,w, self.contentOffset.x);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                //            self.contentOffset = CGPointMake(self.frame.size.width / 2, 0);
            }];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:10 initialSpringVelocity:50 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            //计算偏移
            CGFloat contentOffsetX = self.contentOffset.x + (self.frame.size.width - w) / 2;
            
            CGFloat temp =  self.contentSize.width - self.frame.size.width;
            if (contentOffsetX > temp) {
                contentOffsetX = temp;
            }
            
            self.contentOffset = CGPointMake(contentOffsetX, 0);
            self.bottomView.frame = CGRectMake(x, y, w, h);
            NSLog(@"x = %f w = %f contentOffset.x = %f ",x,w, self.contentOffset.x);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
//                self.contentOffset = CGPointMake(self.frame.size.width / 2, 0);
            }];
        }];
    }
    

}

//计算按钮位置
-(void)changeFrame:(UIButton *)btn{
    
}

#pragma mark -set

-(void)setStrArr:(NSArray *)strArr{
    _strArr = strArr;
    
    NSInteger count = self.strArr.count;
    
    CGFloat btnX = 0;
    for (int i = 0; i < count; i++) {
        //计算宽度
        NSDictionary *nameAttri = @{NSFontAttributeName : XMGNameFont};
        CGSize strSize = [(NSString *)_strArr[i] sizeWithAttributes:nameAttri];
        CGFloat btnW = strSize.width + 20;
        CGFloat btnH = 42;
        CGFloat btnY = 0;
        //创建Btn
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        btn.tag = i;
        btn.titleLabel.font = XMGNameFont;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:_strArr[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor purpleColor]];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        btnX = btnX + btnW;
    }
    self.contentSize = CGSizeMake(btnX, 44);
}



@end
