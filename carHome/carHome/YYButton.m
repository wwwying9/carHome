//
//  YYButton.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYButton.h"

@implementation YYButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)buttonWithString:(NSString *)str tag:(NSInteger)tag frame:(CGRect)frame{
    
    YYButton *btn = [[self alloc]initWithFrame:frame];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTag:tag];
    [btn setTitle:str forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return btn;
}

- (void)setHighlighted:(BOOL)highlighted{
    
}


@end
