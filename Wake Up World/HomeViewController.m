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
#import "SettingsViewController.h"


@interface HomeViewController ()

- (void) updateTime;
- (IBAction) incCredits:(id)sender;
- (IBAction) decCredits:(id)sender;
- (IBAction) toggleAlarm:(id)sender;
- (IBAction) pan:(UIPanGestureRecognizer *)recognizer;
- (IBAction) touch:(UITapGestureRecognizer *)recognizer;
- (IBAction) showSettings:(id)sender;

@end

@implementation HomeViewController

@synthesize time;
@synthesize date;
@synthesize alarmGoingOff;
@synthesize notificationID;
@synthesize buttons;
@synthesize snoozes;
@synthesize credits;
@synthesize animator;
@synthesize cotdLabel;
@synthesize cotdView;
@synthesize defaultLabel;
@synthesize defaultView;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
}
                                                                            
- (void) viewWillAppear:(BOOL)animated
{
    [self updateTime];
    [self updateCredits];
}
                                                                            
- (void) viewDidAppear:(BOOL)animated
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

- (void) updateTime
{
    NSDate *now = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"h:mm"];
    
    NSString *currTime = [df stringFromDate:now];
    
    [self.time setText:currTime];
    
    [df setDateFormat:@"EEE, MMM d, yyyy"];
    currTime = [df stringFromDate:now];
    [self.date setText:currTime];
    
    // Delay execution of my block for 10 seconds.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{ [self updateTime]; });
}

- (IBAction) toggleAlarm:(id)sender
{
    [self toggleSnoozeButtonsWithAnimation:YES];
}

- (void) toggleSnoozeButtonsWithAnimation:(BOOL)animated;
{
    // make sure snoozes view is visible before animate up
    if (self.snoozes.frame.origin.y >= self.view.frame.size.height) {
        self.snoozes.hidden = NO;
    }
    
    if (animated) {
        [UIView animateWithDuration:0.5 animations:^(){
            [self.buttons setAlpha:1 - self.buttons.alpha];
            [self.credits setAlpha:1 - self.credits.alpha];
            [self.wakeUp setAlpha:1 - self.wakeUp.alpha];
            CGFloat y = self.snoozes.frame.origin.y < self.view.frame.size.height ? self.snoozes.frame.size.height : -self.snoozes.frame.size.height;
            self.snoozes.frame = CGRectOffset(self.snoozes.frame, 0, y);
        } completion:^(BOOL finished){
            if (self.snoozes.frame.origin.y >= self.view.frame.size.height) {
                self.snoozes.hidden = YES;
            }
        }];
    } else {
        [self.buttons setAlpha:1 - self.buttons.alpha];
        [self.credits setAlpha:1 - self.credits.alpha];
        [self.wakeUp setAlpha:1 - self.wakeUp.alpha];
        CGFloat y = self.snoozes.frame.origin.y < self.view.frame.size.height ? self.snoozes.frame.size.height : -self.snoozes.frame.size.height;
        self.snoozes.frame = CGRectOffset(self.snoozes.frame, 0, y);
        self.snoozes.hidden = !self.snoozes.hidden;
    }
}

- (void) updateCredits
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber * availableCredits = [defaults valueForKey:@"AvailableCredits"];
    if ([availableCredits intValue] <=5 ) {
        [self.credits setTextColor:[UIColor redColor]];
    } else {
        [self.credits setTextColor:[UIColor colorWithRed:56/255.0 green:163/255.0 blue:104/255.0 alpha:1]];
    }
    [self.credits setText:[NSString stringWithFormat:@"Snoozes: %d", [availableCredits intValue]]];
}

- (IBAction) incCredits:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *creds = [defaults valueForKey:@"AvailableCredits"];
    creds = [NSNumber numberWithInt:[creds intValue] + 1];
    [defaults setValue:creds forKey:@"AvailableCredits"];
    [self updateCredits];
}

- (IBAction) decCredits:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *creds = [defaults valueForKey:@"AvailableCredits"];
    creds = [NSNumber numberWithInt:[creds intValue] - 1];
    [defaults setValue:creds forKey:@"AvailableCredits"];
    [self updateCredits];
}

- (IBAction) pan:(UIPanGestureRecognizer *)recognizer
{
    UIView *panView = recognizer.view;
    CGPoint translation = [recognizer translationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        
        
        CGRect newButtonFrame = panView.frame;
        newButtonFrame.origin.x += translation.x;
        
        if (newButtonFrame.origin.x < panView.frame.origin.x) {
            return;
        }
        
        panView.frame = newButtonFrame;
        
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        if (panView.frame.origin.x > self.view.frame.size.width / 3 - 320 || [recognizer velocityInView:self.view].x > 500) {
            [UIView animateWithDuration:0.5 animations:^(){
                panView.frame = CGRectOffset(panView.frame, - panView.frame.origin.x, 0);
            } completion:^(BOOL finished){
                [self toggleSnoozeButtonsWithAnimation:YES];
                panView.frame = CGRectOffset(panView.frame, - panView.frame.origin.x - 320, 0);
                if (panView != self.wakeUp) {
                    [self decCredits:nil];
                    // TODO: Restart alarm for 9 min.
                }
                [((AppDelegate *)[[UIApplication sharedApplication] delegate]).player stop];
            }];
        } else {
            [UIView animateWithDuration:0.5 animations:^(){
                panView.frame = CGRectOffset(panView.frame, - panView.frame.origin.x - 320, 0);
            }];
        }
    }
}

- (IBAction) touch:(UITapGestureRecognizer *)recognizer
{
    UIView *touchedView = recognizer.view;
    NSLog(@"%@", touchedView);
}

- (IBAction) showSettings:(id)sender
{
    SettingsViewController * settings = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    settings.homeViewController = self;
    [self presentViewController:settings animated:YES completion:nil];
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
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

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
