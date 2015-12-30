//
//  RootViewController.m
//  秒表
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 mxl. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (void)viewDidLoad{

    [super viewDidLoad];
    [self creatButton];
    [self creatLabel];
    [self creatTimer];
    //
    [self createABC];
}


- (void)createABC
{
    NSString *abc = @"abc";



}

- (void)didReceiveMemoryWarning{

    [super didReceiveMemoryWarning];
}


- (void)creatButton{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 300, self.view.frame.size.width - 200, 70);
    button.backgroundColor = [UIColor colorWithRed:0.123 green:0.678 blue:0.233 alpha:1.000];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:40];
    [button addTarget:self action:@selector(watchRun:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 380, self.view.frame.size.width - 200, 70);
    button1.backgroundColor = [UIColor colorWithRed:0.123 green:0.678 blue:0.233 alpha:1.000];
    [button1 setTitle:@"复位" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:40];
    [button1 addTarget:self action:@selector(resetWatch) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
}

- (void)creatLabel{
    
    [self initWithTime];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld:%.2ld", _hNumber, _sNumber, _mNumber, _hNumber];
    label.textColor = [UIColor colorWithRed:0.127 green:0.740 blue:0.419 alpha:1.000];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40];
    label.tag = 2;
    [self.view addSubview:label];
}
- (void)creatTimer{

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(secondPlus) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];

}

- (void)watchRun:(UIButton *)button{

    static BOOL run = YES;
    [button setTitle:(run == YES) ? @"暂停" : @"开始" forState:UIControlStateNormal];
    [_timer setFireDate:(run == YES) ? [NSDate distantPast] : [NSDate distantFuture]];
    run = !run;
}

- (void)resetWatch{

    UILabel *label = (UILabel *)[self.view viewWithTag:2];
    [_timer setFireDate:[NSDate distantFuture]];
    [self initWithTime];
    label.text = [NSString stringWithFormat:@"00:00:00:00"];
}

- (void)secondPlus{

    (_hmNumber > 99) ? ((++_mNumber) && (_hmNumber = 0)): (_hmNumber++);
    (_mNumber > 59) ? ((++_sNumber) && (_mNumber = 0)) : 0;
    (_sNumber > 59) ? ((++_hNumber) && (_sNumber = 0)) : 0;
    (_hNumber > 59) ? ((_sNumber = 0)&&(_hmNumber = 0)&&(_mNumber = 0)&&(_hNumber = 0)):0;
    UILabel *label = (UILabel *)[self.view viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld:%.2ld", _hNumber, _sNumber, _mNumber, _hmNumber];
    
}

- (void)initWithTime{

    _hmNumber = 0;
    _mNumber = 0;
    _sNumber = 0;
    _hNumber = 0;
}

/**
 NSInteger _hmNumber;
 NSInteger _mNumber;
 NSInteger _sNumber;
 NSInteger _hNumber;
 */
@end










