//
//  NavigationAnimator.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewControllerTransitioning.h"
#import "MDWAnimatorTransitionStyle.h"

@interface NavigationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPushed;

@end
