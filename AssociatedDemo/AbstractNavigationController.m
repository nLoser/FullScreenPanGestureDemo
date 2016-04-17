//
//  AbstractNavigationController.m
//  AssociatedDemo
//
//  Created by LV on 16/4/17.
//  Copyright © 2016年 lvhongyang. All rights reserved.
//

#import "AbstractNavigationController.h"
#import "UINavigationController+FullScreenBackGesture.h"

@interface AbstractNavigationController ()
@property (nonatomic, strong) UISwitch * swith;
@end

@implementation AbstractNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.enableFullScreenPanGesture = YES;

    [self.view addSubview:self.swith];
}

- (UISwitch *)swith
{
    if (!_swith)
    {
        _swith = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 80, 60)];
        
        [_swith addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return  _swith;
}

- (void)switchAction:(UISwitch *)sw
{
    if (sw.isOn)
    {
        self.navigationBarHidden = YES;
    }
    else
    {
        self.navigationBarHidden = NO;
    }
}


@end
