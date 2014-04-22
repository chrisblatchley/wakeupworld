//
//  HomeViewController.h
//  AlarmClock
//
//  Created by Alex Gordon on 7/9/13.
//  Copyright (c) 2013 Alex Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel * time;
@property (strong, nonatomic) IBOutlet UILabel * date;
@property (strong, nonatomic) IBOutlet UIView * buttons;
@property (strong, nonatomic) IBOutlet UIView * snoozes;
@property (strong, nonatomic) IBOutlet UILabel * cotdLabel;
@property (strong, nonatomic) IBOutlet UIView *cotdView;
@property (strong, nonatomic) IBOutlet UILabel * defaultLabel;
@property (strong, nonatomic) IBOutlet UIView *defaultView;
@property (strong, nonatomic) IBOutlet UIImageView * wakeUp;
@property (strong, nonatomic) IBOutlet UILabel *credits;

@property (nonatomic) BOOL alarmGoingOff;
@property (nonatomic,assign) int notificationID;
@property (nonatomic,assign) int alarmIndex;
@property (nonatomic,assign) BOOL editMode;
@property (strong) UIDynamicAnimator* animator;

- (void) toggleSnoozeButtonsWithAnimation:(BOOL)animated;
- (void) updateCredits;

@end