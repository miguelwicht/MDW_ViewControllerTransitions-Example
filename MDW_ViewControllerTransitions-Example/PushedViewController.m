//
//  PushedViewController.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "PushedViewController.h"
#import "AppDelegate.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

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

- (void)initButtons
{
    self.popViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.popViewControllerButton setFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    [self.popViewControllerButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.popViewControllerButton setTitle:@"Pop ViewController" forState:UIControlStateNormal];
    [self.popViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.popViewControllerButton];
}

- (void)buttonPressed:(id)sender
{
    if (sender == self.popViewControllerButton)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - TransitionViewControllerDelegate

- (CGRect)containerFrame
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return appDelegate.window.frame;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
