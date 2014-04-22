//
//  SettingsTableViewController.h
//  WakeUpWorld
//
//  Created by Chris Blatchley on 4/21/14.
//  Copyright (c) 2014 Alex Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, readwrite) HomeViewController *homeViewController;
@property (strong, nonatomic) NSMutableArray *charities;

@end
