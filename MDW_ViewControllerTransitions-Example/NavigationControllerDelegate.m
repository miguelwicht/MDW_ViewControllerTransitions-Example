//
//  NavigationControllerDelegate.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NavigationAnimator.h"
#import "PushedViewController.h"

@implementation NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        PushedViewController *toViewController = (PushedViewController *) toVC;
        NavigationAnimator *animator = [NavigationAnimator new];
        animator.isPushed = YES;
        animator.transitionStyle = toViewController.pushTransitionStyle;
        return animator;
    }
    
    if (operation == UINavigationControllerOperationPop)
    {
        PushedViewController *fromViewController = (PushedViewController *) fromVC;
        NavigationAnimator *animator = [NavigationAnimator new];
        animator.transitionStyle = fromViewController.popTransitionStyle;
        return animator;
    }
    
    return nil;
}

@end
