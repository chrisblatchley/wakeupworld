//
//  EasyCustomTableController.h
//  EasyCustomTable
//
//  Created by Matt Gallagher on 27/04/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import <UIKit/UIKit.h>
#import "AddEditAlarmViewController.h"

@interface AlarmListTableController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddEditAlarmDelegate>

@property (nonatomic, strong) NSMutableArray *alarms;

@end

