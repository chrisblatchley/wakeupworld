//
//  AlarmListTableController.m
//  AlarmListTableController
//


#import "AlarmListTableController.h"
#import "AlarmObject.h"
#import "AddEditAlarmViewController.h"
#import "AlarmTableViewCell.h"


@implementation AlarmListTableController

@synthesize alarms;

//
// viewDidLoad
//
// Configures the table after it is loaded.
//
- (void)viewDidLoad
{
    // Fetch Alarms from CoreData
    // TODO: Actually convert storage to CoreData
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *alarmListData = [defaults objectForKey:@"AlarmListData"];
    self.alarms = [NSKeyedUnarchiver unarchiveObjectWithData:alarmListData];
    
    // Set up custom tableViewCells
    [self.tableView registerNib:[UINib nibWithNibName:@"AlarmTableViewCell" bundle:nil] forCellReuseIdentifier:@"customCell"];
}


//
// numberOfSectionsInTableView:
//
// Return the number of sections for the table.
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

//
// tableView:numberOfRowsInSection:
//
// Returns the number of rows in a given section.
//
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.alarms)
    {
        return [self.alarms count];
    }
    else return 0;
}

- (void)tableViewAlarms:(UITableView *)tableViewAlarms didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"AlarmListToEditAlarm" sender:self];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AlarmListToEditAlarm"])
    {
        AddEditAlarmViewController *controller = (AddEditAlarmViewController *)segue.destinationViewController;
        controller.indexOfAlarmToEdit = self.tableView.indexPathForSelectedRow.row;
        controller.editMode = YES;
    }
}
//
// tableView:cellForRowAtIndexPath:
//
// Returns the cell for a given indexPath.
//
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDateFormatter * dateReader = [[NSDateFormatter alloc] init];
    [dateReader setDateFormat:@"hh:mm a"];
    AlarmObject *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
    
    NSString *label = currentAlarm.label;
    BOOL enabled = currentAlarm.enabled;
    NSString *date = [dateReader stringFromDate:currentAlarm.timeToSetOff];

	static NSString *CellIdentifier = @"customCell";
    AlarmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.toggle.on = enabled;
    cell.time.text = date;
    
	return cell;
}

-(void)toggleAlarmEnabledSwitch:(id)sender
{
    UISwitch *mySwitch = (UISwitch *)sender;
    
    if(mySwitch.isOn == NO)
    {
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *eventArray = [app scheduledLocalNotifications];
        AlarmObject *currentAlarm = [self.alarms objectAtIndex:mySwitch.tag];
        currentAlarm.enabled = NO;
        for (int i=0; i<[eventArray count]; i++)
        {
            UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
            NSDictionary *userInfoCurrent = oneEvent.userInfo;
            NSString *uid=[NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:@"notificationID"]];
            if ([uid isEqualToString:[NSString stringWithFormat:@"%i",mySwitch.tag]])
            {
                //Cancelling local notification            
                [app cancelLocalNotification:oneEvent];
                break;
            }
        }
        
    }
    else if(mySwitch.isOn == YES)
    {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        AlarmObject *currentAlarm = [self.alarms objectAtIndex:mySwitch.tag];
        currentAlarm.enabled = YES;
        if (!localNotification)
            return;

        localNotification.repeatInterval = NSDayCalendarUnit;
        [localNotification setFireDate:currentAlarm.timeToSetOff];
        [localNotification setTimeZone:[NSTimeZone defaultTimeZone]];
        // Setup alert notification
        [localNotification setAlertBody:@"Alarm" ];
        [localNotification setAlertAction:@"Open App"];
        [localNotification setHasAction:YES];
        
        
        NSNumber* uidToStore = [NSNumber numberWithInt:currentAlarm.notificationID];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:uidToStore forKey:@"notificationID"];
        localNotification.userInfo = userInfo;
        
        // Schedule the notification
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    NSData *alarmListData2 = [NSKeyedArchiver archivedDataWithRootObject:self.alarms];
    [[NSUserDefaults standardUserDefaults] setObject:alarmListData2 forKey:@"AlarmListData"];
}
//
// dealloc
//
// Releases instance memory.
//


@end


