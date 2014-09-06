//
//  ViewControllerTransitioning.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 02.09.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDWAnimatorTransitionStyle.h"

@protocol ViewControllerTransitioning <NSObject>

@property (nonatomic) MDWAnimatorTransitionStyle appearingTransitionStyle;
@property (nonatomic) MDWAnimatorTransitionStyle disappearingTransitionStyle;

@property (nonatomic) CGRect finalFrame;

@end
