//
//  AbstractNavigationController.m
//  AssociatedDemo
//
//  Created by LV on 16/4/17.
//  Copyright © 2016年 lvhongyang. All rights reserved.
//

#import "AbstractNavigationController.h"
#import "UINavigationController+FullScreenBackGesture.h"


@implementation AbstractNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.enableFullScreenPanGesture = YES;
}

@end
