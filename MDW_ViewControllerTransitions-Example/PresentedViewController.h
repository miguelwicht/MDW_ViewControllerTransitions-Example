//
//  PresentedViewController.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerTransitioning.h"

@interface PresentedViewController : UIViewController <ViewControllerTransitioning>

@property (nonatomic) MDWAnimatorTransitionStyle appearingTransitionStyle;
@property (nonatomic) MDWAnimatorTransitionStyle disappearingTransitionStyle;
@property (nonatomic) CGRect finalFrame;

@property (nonatomic, strong) UIButton *dismissViewControllerButton;

@end
