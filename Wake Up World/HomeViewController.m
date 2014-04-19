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
- (IBAction) toggleSnooze:(id)sender;
- (IBAction)pan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)touch:(UITapGestureRecognizer *)recognizer;

@end

@implementation HomeViewController

@synthesize time;
@synthesize alarmGoingOff;
@synthesize notificationID;
@synthesize buttons;
@synthesize snoozes;
@synthesize alarms;
@synthesize animator;
@synthesize cotdLabel;
@synthesize cotdView;
@synthesize defaultLabel;
@synthesize defaultView;

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
}
                                                                            
- (void)viewWillAppear:(BOOL)animated
{
    [self updateTime];
}
                                                                            
- (void)viewDidAppear:(BOOL)animated
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
    
    // Delay execution of my block for 10 seconds.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{ [self updateTime]; });
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
            [self.alarms setAlpha:1 - self.alarms.alpha];
            CGFloat y = self.snoozes.frame.origin.y < self.view.frame.size.height ? self.snoozes.frame.size.height : -self.snoozes.frame.size.height;
            self.snoozes.frame = CGRectOffset(self.snoozes.frame, 0, y);
        } completion:^(BOOL finished){
            if (self.snoozes.frame.origin.y >= self.view.frame.size.height) {
                self.snoozes.hidden = YES;
            }
        }];
    } else {
        [self.alarms setAlpha:1 - self.alarms.alpha];
        [self.buttons setAlpha:1 - self.buttons.alpha];
        CGFloat y = self.snoozes.frame.origin.y < self.view.frame.size.height ? self.snoozes.frame.size.height : -self.snoozes.frame.size.height;
        self.snoozes.frame = CGRectOffset(self.snoozes.frame, 0, y);
        self.snoozes.hidden = !self.snoozes.hidden;
    }
}

- (IBAction) toggleSnooze:(id)sender
{
    [self toggleSnoozeButtonsWithAnimation:YES];
}

- (IBAction)pan:(UIPanGestureRecognizer *)recognizer
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
            }];
        } else {
            [UIView animateWithDuration:0.5 animations:^(){
                panView.frame = CGRectOffset(panView.frame, - panView.frame.origin.x - 320, 0);
            }];
        }
    }
}

- (IBAction)touch:(UITapGestureRecognizer *)recognizer
{
    UIView *touchedView = recognizer.view;
    NSLog(@"%@", touchedView);
    /*
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    [animation setFromValue:[NSNumber numberWithFloat:touchedView.frame.origin.x]];
    [animation setToValue:[NSNumber numberWithFloat:touchedView.frame.origin.x]];
    [animation setDuration:0.5];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :1 :1]];
    [touchedView.layer addAnimation:animation forKey:@"bounceAnim"];
     */
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
