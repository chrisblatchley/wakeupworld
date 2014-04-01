//
//  Alarm.h
//  Wake Up World
//
//  Created by Chris Blatchley on 3/31/14.
//  Copyright (c) 2014 Alex Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Alarm : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSNumber * notificationId;

@end
