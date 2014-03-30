//
//  HomeViewController.h
//  AlarmClock
//
//  Created by Alex Gordon on 7/9/13.
//  Copyright (c) 2013 Alex Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIAlertViewDelegate>

@property(strong, nonatomic) IBOutlet UILabel * hourLabel1;
@property(strong, nonatomic) IBOutlet UILabel * hourLabel2;
@property(strong, nonatomic) IBOutlet UILabel * minuteLabel1;
@property(strong, nonatomic) IBOutlet UILabel * minuteLabel2;
@property(strong, nonatomic) IBOutlet UILabel * colon;
@property(nonatomic) BOOL alarmGoingOff;
@property (strong, nonatomic) IBOutlet UIView *center;
@property (strong, nonatomic) IBOutlet UIView *home;
@property(nonatomic,assign) int notificationID;
@property(nonatomic,assign) int alarmIndex;
@property(nonatomic,assign) BOOL editMode;
@property (nonatomic, strong) IBOutlet UINavigationItem *navItem;





@end