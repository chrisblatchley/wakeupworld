//
//  HomeViewController.h
//  AlarmClock
//
//  Created by Alex Gordon on 7/9/13.
//  Copyright (c) 2013 Alex Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (strong, nonatomic) IBOutlet UILabel * time;

@property (nonatomic) BOOL alarmGoingOff;
@property (nonatomic,assign) int notificationID;
@property (nonatomic,assign) int alarmIndex;
@property (nonatomic,assign) BOOL editMode;

@end