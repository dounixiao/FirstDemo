//
//  RootViewController.h
//  秒表
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 mxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController{

    NSInteger _hmNumber;
    NSInteger _mNumber;
    NSInteger _sNumber;
    NSInteger _hNumber;
    NSTimer *_timer;
}

@end
