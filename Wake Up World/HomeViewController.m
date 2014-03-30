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
#import "AlarmLabelEditViewController.h"
#import "AddEditAlarmViewController.h"
#import "AlarmListTableController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize hourLabel1;
@synthesize hourLabel2;
@synthesize minuteLabel1;
@synthesize minuteLabel2;
@synthesize colon;
@synthesize alarmGoingOff;
@synthesize center;
@synthesize home;
@synthesize notificationID;


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
    [self myTimerAction];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //How often to update the clock labels
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(myTimerAction) userInfo:nil repeats:YES];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];
}

- (void)viewWillAppear:(BOOL)animated
{
    colon.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    hourLabel1.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    minuteLabel1.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    hourLabel2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    minuteLabel2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    
    
}

-(void)myTimerAction
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"hh:mm:ss"];
    NSString *hourMinuteSecond = [dateFormatter stringFromDate:date];
    
    hourLabel1.text = [hourMinuteSecond substringWithRange:NSMakeRange(0, 1)];
    if ([hourLabel1.text isEqual: @"0"])
    {
        [self.hourLabel1 setHidden:YES];
        //CGSize size = self.view.frame.size;
        self.center.frame = CGRectMake(50.0, 0.0, 224.0, 163.0);

    }
    else if (![hourLabel1.text isEqual: @"0"])
    {
        [self.hourLabel1 setHidden:NO];
        //[self.home setCenter:CGPointMake(center.frame.size.width / 2, center.frame.size.height / 2)];
    }
    hourLabel2.text = [hourMinuteSecond substringWithRange:NSMakeRange(1, 1)];
    minuteLabel1.text = [hourMinuteSecond substringWithRange:NSMakeRange(3, 1)];
    minuteLabel2.text = [hourMinuteSecond substringWithRange:NSMakeRange(4, 1)];
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
