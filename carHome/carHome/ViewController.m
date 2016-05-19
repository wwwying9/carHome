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
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showView.alwaysBounceVertical = NO;
    self.showView.alwaysBounceHorizontal = NO;
    
//    [self showViewInit];
}

@end
