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
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    [self initButtons];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end