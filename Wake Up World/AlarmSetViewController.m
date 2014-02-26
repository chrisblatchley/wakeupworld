//
//  AlarmSetViewController.m
//  Wake Up World
//
//  Created by Alex Gordon on 7/28/13.
//  Copyright (c) 2013 Alex Gordon. All rights reserved.
//

#import "AlarmSetViewController.h"
#import "AlarmObject.h"

@interface AlarmSetViewController ()

@end

@implementation AlarmSetViewController

@synthesize navItem;

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
	// Do any additional setup after loading the view.
    
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
}
- (void)scheduleLocalNotificationWithDate:(NSDate *)fireDate
                                  atIndex:(int)indexOfObject {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    
    if (!localNotification)
        return;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh-mm -a";
    NSDate* date = [dateFormatter dateFromString:[dateFormatter stringFromDate:timeToSetOff.date]];
    
    localNotification.repeatInterval = NSDayCalendarUnit;
    [localNotification setFireDate:date];
    [localNotification setTimeZone:[NSTimeZone defaultTimeZone]];
    // Setup alert notification
    [localNotification setAlertBody:@"Alarm" ];
    [localNotification setAlertAction:@"Open App"];
    [localNotification setHasAction:YES];
    
    NSLog(@"%@", date);
    //This array maps the alarms uid to the index of the alarm so that we can cancel specific local notifications
    
    NSNumber* uidToStore = [NSNumber numberWithInt:indexOfObject];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:uidToStore forKey:@"notificationID"];
    localNotification.userInfo = userInfo;
    NSLog(@"Uid Store in userInfo %@", [localNotification.userInfo objectForKey:@"notificationID"]);
    
    // Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
