//
//  NavigationAnimator.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MDWAnimatorTransitionStyle)
{
    MDWAnimatorTransitionStyleSlideInFromTop = 0,
    MDWAnimatorTransitionStyleSlideOutToTop,
    MDWAnimatorTransitionStyleSlideInFromRight,
    MDWAnimatorTransitionStyleSlideOutToRight,
};

@interface NavigationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPushed;
@property (nonatomic) MDWAnimatorTransitionStyle transitionStyle;

@end
