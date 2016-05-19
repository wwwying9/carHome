//
//  YYButton.h
//  carHome
//
//  Created by 姚英 on 16/5/19.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYButton : UIButton

/// 用于保存按钮的位置信息,yes表示在top,no表示在bottom
@property(nonatomic, assign, getter=isTop) BOOL status;

+ (instancetype)buttonWithString:(NSString *)str tag:(NSInteger)tag frame:(CGRect)frame;

@end
