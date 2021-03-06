//
//  CFIRootViewController.m
//  FCSK
//
//  Created by Mahesh on 5/10/14.
//  Copyright (c) 2014 Mahesh. All rights reserved.
//

#import "CFIRootViewController.h"
#import "CFIMapViewController.h"
#import "CFISignInViewController.h"
#import "CFIStatsViewController.h"
#import "SCViewController.h"
#import "CFIRegisterUserViewController.h"
#import "CFIShareRegionInfo.h"

@interface CFIRootViewController ()

@property(strong, nonatomic)NSDateFormatter *formatter;

@property (weak, nonatomic) IBOutlet UIButton *statBtn;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerUserBtn;
@property (weak, nonatomic) IBOutlet UIButton *mapBtn;
@property (weak, nonatomic) IBOutlet UILabel *dayLbl;
@property (weak, nonatomic) IBOutlet UILabel *weekDayName;

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
    [self addBackgroundImage];
    
    // show login view controller
    CFISignInViewController *sign = [[CFISignInViewController alloc]initWithNibName:@"CFISignInViewController" bundle:nil];
    [self.navigationController presentViewController:sign animated:NO completion:^{
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // update the label
    self.formatter = [[NSDateFormatter alloc]init];
    [self.formatter setDateFormat:@"MMM dd"];
    self.dayLbl.text = [[self formatter]stringFromDate:[NSDate date]];
    [self.formatter setDateFormat:@"EEEE"];
    self.weekDayName.text = [self.formatter stringFromDate:[NSDate date]];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Image View
- (void)addBackgroundImage
{
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"storm.jpg"]];
    [view addSubview:imageView];
    
    /*UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)/2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:toolbar];*/
    
    [self.view sendSubviewToBack:view];
    
    [self.view bringSubviewToFront:self.statBtn];
    [self.view bringSubviewToFront:self.scanBtn];
    [self.view bringSubviewToFront:self.registerUserBtn];
    [self.view bringSubviewToFront:self.mapBtn];
    [self.view bringSubviewToFront:self.dayLbl];
    [self.view bringSubviewToFront:self.weekDayName];
}

#pragma mark - Button Actions
- (IBAction)statsButtonPressed:(id)sender {
    CFIStatsViewController *statsController = [[CFIStatsViewController alloc]initWithNibName:@"CFIStatsViewController" bundle:nil];
    [self.navigationController pushViewController:statsController animated:YES];
    
    [statsController loadBoothDetaisl:[CFIShareRegionInfo sharedInstance].currentBuuth.ID];
}

- (IBAction)scanButtonPressed:(id)sender
{
    SCViewController *scanViewController = [[SCViewController alloc] initWithNibName:@"CFIScanViewController" bundle:nil];
    scanViewController.hasUserRegistered = YES;
    [self.navigationController pushViewController:scanViewController animated:YES];
    
    
}
- (IBAction)registerUserButtonPressed:(id)sender
{
    CFIRegisterUserViewController *registerController = [[CFIRegisterUserViewController alloc] initWithNibName:@"CFIRegisterUserViewController" bundle:nil];
    
    [self.navigationController pushViewController:registerController animated:YES];
    
}
- (IBAction)mapButtonPressed:(id)sender {
    
    CFIMapViewController *map = [[CFIMapViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:map animated:YES];
}

@end
