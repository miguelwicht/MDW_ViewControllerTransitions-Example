//
//  MDWSlideTransitionAnimator.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "MDWSlideTransitionAnimator.h"
#import "AppDelegate.h"

@implementation MDWSlideTransitionAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<ViewControllerTransitioning> *toViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController<ViewControllerTransitioning> *fromViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (self.isAppearing)
    {
        [self appearhWithTransitionStyle:toViewController.appearingTransitionStyle andTransitionContext:transitionContext];
    }
    else
    {
        [self disappearWithTransitionStyle:fromViewController.disappearingTransitionStyle andTransitionContext:transitionContext];
    }
}

- (void)appearhWithTransitionStyle:(MDWAnimatorTransitionStyle)transitionStyle andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<ViewControllerTransitioning> *toViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController<ViewControllerTransitioning> *fromViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    fromViewController.view.userInteractionEnabled = NO;
    [transitionContext.containerView addSubview:fromViewController.view];
    [transitionContext.containerView addSubview:toViewController.view];
    
    // get the frame of the presenting/pushing controller
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
    
    // save the frame where the presented / pushed controller should end up
    CGRect endFrame = toViewController.finalFrame;
    
    // move frame to start position
    CGRect originFrame = [self getOffsetRectForRect:initialFrame andTransitionStyle:transitionStyle];
    originFrame.origin.x += endFrame.origin.x;
    originFrame.origin.y += endFrame.origin.y;
    originFrame.size.width = endFrame.size.width;
    originFrame.size.height = endFrame.size.height;
    toViewController.view.frame = originFrame;
    
    // animate fromViewController
    CGRect fromViewEndFrame = fromViewController.view.frame;
    
    switch ([fromViewController.transitionCoordinator presentationStyle])
    {
        case UIModalPresentationNone:
        {
            fromViewEndFrame = [self getOffsetRectForRect:fromViewEndFrame andTransitionStyle:transitionStyle];
            fromViewEndFrame.origin.x *= -1;
            fromViewEndFrame.origin.y *= -1;
            break;
        }
        default:
            break;
    }
    
    [[fromViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		fromViewController.view.frame = fromViewEndFrame;
	
    } completion:NULL];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = endFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)disappearWithTransitionStyle:(MDWAnimatorTransitionStyle)transitionStyle andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<ViewControllerTransitioning> *toViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController<ViewControllerTransitioning> *fromViewController = (UIViewController<ViewControllerTransitioning>*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    toViewController.view.userInteractionEnabled = YES;
    
    [transitionContext.containerView addSubview:toViewController.view];
    [transitionContext.containerView addSubview:fromViewController.view];
    
    // get the frame of the presenting/pushing controller
    CGRect initialFrame = [transitionContext finalFrameForViewController:toViewController];
    
    // save the frame where the presented / pushed controller should end up
    CGRect endFrame = [self getOffsetRectForRect:initialFrame andTransitionStyle:transitionStyle];
    CGRect originFrame = fromViewController.finalFrame;
    endFrame.origin.x += originFrame.origin.x;
    endFrame.origin.y += originFrame.origin.y;
    endFrame.size.width = originFrame.size.width;
    endFrame.size.height = originFrame.size.height;
    
    // animate toViewController
    CGRect toViewEndFrame = toViewController.view.frame;
    CGRect toViewStartFrame = toViewEndFrame;
    switch ([toViewController.transitionCoordinator presentationStyle])
    {
        case UIModalPresentationNone:
        {
            toViewStartFrame = [self getOffsetRectForRect:toViewStartFrame andTransitionStyle:transitionStyle];
            toViewStartFrame.origin.x *= -1;
            toViewStartFrame.origin.y *= -1;
            break;
        }
        default:
            break;
    }
    
    toViewController.view.frame = toViewStartFrame;
    
    [[toViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		toViewController.view.frame = toViewEndFrame;
        
    } completion:NULL];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.frame = endFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (CGRect)getOffsetRectForRect:(CGRect)rect andTransitionStyle:(MDWAnimatorTransitionStyle)transitionStyle
{
    CGRect offsetRect = rect;
    
    switch (transitionStyle)
    {
        case MDWAnimatorTransitionStyleSlideInFromTop:
        case MDWAnimatorTransitionStyleSlideOutToTop:
        {
            offsetRect.origin.y -= rect.size.height;
            break;
        }
        case MDWAnimatorTransitionStyleSlideInFromRight:
        case MDWAnimatorTransitionStyleSlideOutToRight:
        {
            offsetRect.origin.x += rect.size.width;
            break;
        }
            
        default:
            break;
    }
    return offsetRect;
}

@end
