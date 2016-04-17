//
//  UINavigationController+FullScreenBackGesture.m
//  AssociatedDemo
//
//  Created by LV on 16/4/17.
//  Copyright © 2016年 lvhongyang. All rights reserved.
//

#import "UINavigationController+FullScreenBackGesture.h"
#import <objc/runtime.h>

static const char * associatedkeyFullScreenPanGesture       = "associated_key_fullscreenpangesture";
static const char * associatedKeyEnableFullScreenPanGesture = "associated_key_enablefullscreenpangesture";

@interface UINavigationController()<UIGestureRecognizerDelegate>
@end

@implementation UINavigationController (FullScreenBackGesture)

#pragma mark - associated bool value

- (void)setEnableFullScreenPanGesture:(BOOL)enableFullScreenPanGesture
{
    objc_setAssociatedObject(self, associatedKeyEnableFullScreenPanGesture, [NSNumber numberWithBool:enableFullScreenPanGesture], OBJC_ASSOCIATION_ASSIGN);
    
    UIPanGestureRecognizer * fullscreenPan = [self createFullScreenPanGesture];
    
    if (enableFullScreenPanGesture) {
        [self.view addGestureRecognizer:fullscreenPan];
    }else {
        [self.view removeGestureRecognizer:fullscreenPan];
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)enableFullScreenPanGesture
{
    return [(NSNumber *)objc_getAssociatedObject(self, associatedKeyEnableFullScreenPanGesture) boolValue];
}

- (UIPanGestureRecognizer *)createFullScreenPanGesture
{
    UIPanGestureRecognizer * fullscreenPan = objc_getAssociatedObject(self, associatedkeyFullScreenPanGesture);
    
    if (!fullscreenPan)
    {
        id interactiveTarget = self.interactivePopGestureRecognizer.delegate;
        fullscreenPan = [[UIPanGestureRecognizer alloc] initWithTarget:interactiveTarget action:@selector(handleNavigationTransition:)]; //*> handleNavigationTransition: 为私有API，但是可以通过审核
        fullscreenPan.delegate = self;
        objc_setAssociatedObject(self, associatedkeyFullScreenPanGesture, fullscreenPan, OBJC_ASSOCIATION_RETAIN);
    }
    
    return fullscreenPan;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1)
    {
        return NO;
    }
    return YES;
}

@end
