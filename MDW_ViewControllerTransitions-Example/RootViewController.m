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
    [self.pushViewControllerButton setTitle:@"Push from right" forState:UIControlStateNormal];
    [self.pushViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushViewControllerButton];
    
    
    self.pushFromTopViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushFromTopViewControllerButton setFrame:CGRectMake(0, 182, self.view.frame.size.width, 40)];
    [self.pushFromTopViewControllerButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.pushFromTopViewControllerButton setTitle:@"Push from top" forState:UIControlStateNormal];
    [self.pushFromTopViewControllerButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushFromTopViewControllerButton];
}

- (void)buttonPressed:(id)sender
{
    if (sender == self.presentViewControllerButton)
    {
        PresentedViewController *viewController = [[PresentedViewController alloc] initWithNibName:nil bundle:nil];
        viewController.transitioningDelegate = self.transitioningDelegate;
        viewController.modalPresentationStyle = UIModalPresentationCustom;
        viewController.appearingTransitionStyle = MDWAnimatorTransitionStyleSlideInFromTop;
        viewController.disappearingTransitionStyle = MDWAnimatorTransitionStyleSlideOutToTop;
        
        // set frame and save it to property as well because frame.size might not be available in animator
        [viewController.view setFrame:CGRectMake(50, 100, 320 - 100, self.view.frame.size.height - 200)];
        viewController.finalFrame = viewController.view.frame;
        
        [self presentViewController:viewController animated:YES completion:nil];
    }
    else if (sender == self.pushViewControllerButton)
    {
        PushedViewController *viewController = [[PushedViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (sender == self.pushFromTopViewControllerButton)
    {
        PushedViewController *viewController = [[PushedViewController alloc] initWithNibName:nil bundle:nil];
        viewController.appearingTransitionStyle = MDWAnimatorTransitionStyleSlideInFromTop;
        viewController.disappearingTransitionStyle = MDWAnimatorTransitionStyleSlideOutToTop;
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
