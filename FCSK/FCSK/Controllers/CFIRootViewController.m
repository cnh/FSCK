//
//  CFIRootViewController.m
//  FCSK
//
//  Created by Mahesh on 5/10/14.
//  Copyright (c) 2014 Mahesh. All rights reserved.
//

#import "CFIRootViewController.h"

@interface CFIRootViewController ()
@property (weak, nonatomic) IBOutlet UIButton *statBtn;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerUserBtn;
@property (weak, nonatomic) IBOutlet UIButton *mapBtn;

@end

@implementation CFIRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions
- (IBAction)statsButtonPressed:(id)sender {
}

- (IBAction)scanButtonPressed:(id)sender {
}
- (IBAction)registerUserButtonPressed:(id)sender {
}
- (IBAction)mapButtonPressed:(id)sender {
}

@end
