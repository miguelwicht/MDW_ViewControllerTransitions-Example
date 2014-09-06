//
//  MDWBaseTransitionAnimator.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 06.09.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "MDWBaseTransitionAnimator.h"

static NSTimeInterval const kDefaultTransitionDuration = 0.3;

@implementation MDWBaseTransitionAnimator

-(id)init
{
    self = [super init];
    if (self)
    {
        self.transitionDuration = kDefaultTransitionDuration;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {}

@end
