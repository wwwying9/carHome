//
//  YYNavTitleView.m
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "YYNavTitleView.h"

@implementation YYNavTitleView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    NSLog(@"%s",__func__);
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s",__func__);        
    }
    return self;
}

@end
