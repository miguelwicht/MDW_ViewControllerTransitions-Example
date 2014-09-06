//
//  NavigationControllerDelegate.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "MDWSlideTransitionAnimator.h"
#import "PushedViewController.h"

@implementation NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        MDWSlideTransitionAnimator *animator = [MDWSlideTransitionAnimator new];
        animator.appearing = YES;
        
        return animator;
    }
    
    if (operation == UINavigationControllerOperationPop)
    {
        MDWSlideTransitionAnimator *animator = [MDWSlideTransitionAnimator new];
        
        return animator;
    }
    
    return nil;
}

@end
