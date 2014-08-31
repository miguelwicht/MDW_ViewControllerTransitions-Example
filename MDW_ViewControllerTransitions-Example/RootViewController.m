//
//  RootViewController.m
//  MDW_ViewControllerTransitions-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 31.08.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "RootViewController.h"
#import "PresentedViewController.h"
#import "PushedViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [self initTransitioningDeleagte];
    [self initButtons];
}

- (void)initTransitioningDeleagte
{
    self.transitioningDelegate = [[TransitioningDelegate alloc] init];
}

- (void)initButtons
{
    self.presentViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.presentViewControllerButton setFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    [self.presentViewControllerButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.presentViewControllerButton setTitle:@"Present ViewController" forState:UIControlStateNormal];
    [self.presentViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.presentViewControllerButton];
    
    
    self.pushViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushViewControllerButton setFrame:CGRectMake(0, 141, self.view.frame.size.width, 40)];
    [self.pushViewControllerButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.pushViewControllerButton setTitle:@"Push ViewController" forState:UIControlStateNormal];
    [self.pushViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushViewControllerButton];
}

- (void)buttonPressed:(id)sender
{
    if (sender == self.presentViewControllerButton)
    {
        PresentedViewController *viewController = [[PresentedViewController alloc] initWithNibName:nil bundle:nil];
        [viewController.view setFrame:CGRectMake(50, 100, 320, self.view.frame.size.height - 200)];
        viewController.transitioningDelegate = self.transitioningDelegate;
        viewController.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:viewController animated:YES completion:nil];
    }
    else if (sender == self.pushViewControllerButton)
    {
        PushedViewController *viewController = [[PushedViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
