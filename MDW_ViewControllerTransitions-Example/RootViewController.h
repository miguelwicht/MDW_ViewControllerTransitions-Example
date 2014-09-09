//
//  RootViewController.h
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitioningDelegate.h"

@interface RootViewController : UIViewController

@property (nonatomic, strong) UIButton *presentViewControllerButton;
@property (nonatomic, strong) UIButton *presentFromRightViewControllerButton;
@property (nonatomic, strong) UIButton *pushViewControllerButton;
@property (nonatomic, strong) UIButton *pushFromTopViewControllerButton;
@property (nonatomic, strong) TransitioningDelegate *transitioningDelegate;

@end
