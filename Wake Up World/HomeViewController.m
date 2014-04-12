//
//  HomeViewController.m
//  AlarmClock
//
//  Created by Alex Gordon on 7/9/13.
//  Copyright (c) 2013 Alex Gordon. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "AlarmObject.h"
#import "AlarmEditViewController.h"
#import "AddEditAlarmViewController.h"
#import "AlarmListTableController.h"


@interface HomeViewController ()

- (void) updateTime;

@end

@implementation HomeViewController

@synthesize time;
@synthesize alarmGoingOff;
@synthesize notificationID;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) updateTime
{
    NSDate *now = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"h:mm"];
    
    NSString *currTime = [df stringFromDate:now];
    
    [self.time setText:currTime];
    
    // Delay execution of my block for 10 seconds.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{ [self updateTime]; });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateTime];
}

-(void)viewDidAppear:(BOOL)animated
{
    //This checks if the home view is shown because of an alarm firing
    if(self.alarmGoingOff)
    {
        UIAlertView *alarmAlert = [[UIAlertView alloc] initWithTitle:@"Alarm Going Off"
                                                             message:@"Press okay to stop"
                                                            delegate:self
                                                   cancelButtonTitle:@"okay"
                                                   otherButtonTitles:nil, nil];
        [alarmAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        AppDelegate * myAppDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [myAppDelegate.player stop];
    }
    else{
        //do nothing
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
