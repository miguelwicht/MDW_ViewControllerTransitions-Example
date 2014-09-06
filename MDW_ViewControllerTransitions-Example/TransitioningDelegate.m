//
//  TransitioningDelegate.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "MDWSlideTransitionAnimator.h"

@implementation TransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    MDWSlideTransitionAnimator *animator = [MDWSlideTransitionAnimator new];
    animator.appearing = YES;
    
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    MDWSlideTransitionAnimator *animator = [MDWSlideTransitionAnimator new];
    
    return animator;
}

@end
