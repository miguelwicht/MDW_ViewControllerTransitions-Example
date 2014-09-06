//
//  MDWBaseTransitionAnimator.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 06.09.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewControllerTransitioning.h"

@interface MDWBaseTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isAppearing) BOOL appearing;
@property (nonatomic, assign) NSTimeInterval transitionDuration;

@end
