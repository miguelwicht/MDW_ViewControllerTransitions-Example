//
//  PushedViewController.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerTransitioning.h"

@interface PushedViewController : UIViewController <ViewControllerTransitioning>

@property (nonatomic, strong) UIButton *popViewControllerButton;
@property (nonatomic) MDWAnimatorTransitionStyle appearingTransitionStyle;
@property (nonatomic) MDWAnimatorTransitionStyle disappearingTransitionStyle;
@property (nonatomic) CGRect finalFrame;

@end
