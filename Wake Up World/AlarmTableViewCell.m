//
//  AlarmTableViewCell.m
//  Wake Up World
//
//  Created by Chris Blatchley on 3/31/14.
//  Copyright (c) 2014 Alex Gordon. All rights reserved.
//

#import "AlarmTableViewCell.h"

@implementation AlarmTableViewCell

@synthesize time;
@synthesize toggle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
