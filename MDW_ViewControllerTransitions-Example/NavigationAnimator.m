//
//  NavigationAnimator.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "NavigationAnimator.h"
#import "AppDelegate.h"

@implementation NavigationAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPushed)
    {
        [self pushWithTransitionStyle:self.transitionStyle andTransitionContext:transitionContext];
    }
    else
    {
        [self popWithTransitionStyle:self.transitionStyle andTransitionContext:transitionContext];
    }
}

- (void)pushWithTransitionStyle:(MDWAnimatorTransitionStyle)transitionStyle andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CGRect appFrame = appDelegate.window.frame;
    
    switch (transitionStyle)
    {
        case MDWAnimatorTransitionStyleSlideInFromTop:
        {
            fromViewController.view.userInteractionEnabled = NO;
            [transitionContext.containerView addSubview:fromViewController.view];
            [transitionContext.containerView addSubview:toViewController.view];
            
            CGRect endFrame = appFrame;
            CGRect startFrame = endFrame;
            startFrame.origin.y -= appFrame.size.height;
            
            toViewController.view.frame = startFrame;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                toViewController.view.frame = endFrame;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
            break;
        }
        case MDWAnimatorTransitionStyleSlideInFromRight:
        {
            fromViewController.view.userInteractionEnabled = NO;
            [transitionContext.containerView addSubview:fromViewController.view];
            [transitionContext.containerView addSubview:toViewController.view];
            
            CGRect endFrame = appFrame;
            CGRect startFrame = endFrame;
            startFrame.origin.x += appFrame.size.width;
            
            toViewController.view.frame = startFrame;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                toViewController.view.frame = endFrame;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)popWithTransitionStyle:(MDWAnimatorTransitionStyle)transitionStyle andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CGRect appFrame = appDelegate.window.frame;
    
    switch (transitionStyle)
    {
        case MDWAnimatorTransitionStyleSlideOutToTop:
        {
            toViewController.view.userInteractionEnabled = YES;
            
            [transitionContext.containerView addSubview:toViewController.view];
            [transitionContext.containerView addSubview:fromViewController.view];
            
            CGRect endFrame = appFrame;
            endFrame.origin.y -= appFrame.size.height;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                fromViewController.view.frame = endFrame;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
            break;
        }
        case MDWAnimatorTransitionStyleSlideOutToRight:
        {
            toViewController.view.userInteractionEnabled = YES;
            
            [transitionContext.containerView addSubview:toViewController.view];
            [transitionContext.containerView addSubview:fromViewController.view];
            
            CGRect endFrame = appFrame;
            endFrame.origin.x += appFrame.size.width;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                fromViewController.view.frame = endFrame;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
