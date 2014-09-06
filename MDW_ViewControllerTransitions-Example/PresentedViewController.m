//
//  PresentedViewController.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.appearingTransitionStyle = MDWAnimatorTransitionStyleSlideInFromRight;
        self.disappearingTransitionStyle = MDWAnimatorTransitionStyleSlideOutToRight;
        self.finalFrame = [[UIApplication sharedApplication] delegate].window.frame;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    [self initButtons];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    CGRect buttonFrame = self.dismissViewControllerButton.frame;
    buttonFrame.size.width = self.view.frame.size.width;
    self.dismissViewControllerButton.frame = buttonFrame;
}

- (void)initButtons
{
    self.dismissViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.dismissViewControllerButton setFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    [self.dismissViewControllerButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.dismissViewControllerButton setTitle:@"Dismiss ViewController" forState:UIControlStateNormal];
    [self.dismissViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dismissViewControllerButton];
}

- (void)buttonPressed:(id)sender
{
    if (sender == self.dismissViewControllerButton)
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
