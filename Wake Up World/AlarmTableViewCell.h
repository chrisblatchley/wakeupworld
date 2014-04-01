//
//  AlarmTableViewCell.h
//  Wake Up World
//
//  Created by Chris Blatchley on 3/31/14.
//  Copyright (c) 2014 Alex Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel * time;
@property (nonatomic, strong) IBOutlet UISwitch * toggle;

@end
