//
//  AlarmListTableController.m
//  AlarmListTableController
//


#import "AlarmListTableController.h"
#import "AlarmObject.h"
#import "AddEditAlarmViewController.h"
#import "AlarmTableViewCell.h"

#define CUSTOM_CELL @"customCell"

@interface AlarmListTableController ()

@property (strong, readwrite, nonatomic) UITableView *tableView;
@property (strong, readwrite, nonatomic) UINavigationBar *navBar;

- (void) loadData;
- (void) addAlarm;
- (void) testToggle:(id)sender;
- (void)toggleAlarmEnabledSwitch:(id)sender;

@end

@implementation AlarmListTableController

@synthesize alarms;

//
// viewDidLoad
//
// Configures the table after it is loaded.
//
- (void)viewDidLoad
{
    // get data
    [self loadData];
    
    // Setup tableView
    [self.tableView registerNib:[UINib nibWithNibName:@"AlarmTableViewCell" bundle:nil] forCellReuseIdentifier:CUSTOM_CELL];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = YES;
        tableView;
    });
    
    self.navBar = ({
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
        UIBarButtonItem *addAlarmBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addAlarm)];
        UINavigationItem *item = [[UINavigationItem alloc] init];
        item.rightBarButtonItem = addAlarmBarButton;
        [navBar pushNavigationItem:item animated:NO];
        navBar;
    });
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navBar];
}

#pragma mark - TableView Datasource Methods

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
    else return 1;
}

#pragma mark - TableView Delegate Methods

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Editing alarm!");
    AddEditAlarmViewController *addAlarmVC = [[AddEditAlarmViewController alloc] initWithNibName:@"AddEditAlarmViewController" bundle:nil];
    addAlarmVC.delegate = self;
    [addAlarmVC setEditMode:YES];
    [addAlarmVC setIndexOfAlarmToEdit:indexPath.row];
    [self presentViewController:addAlarmVC animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Deleted!");
}

//
// tableView:cellForRowAtIndexPath:
//
// Returns the cell for a given indexPath.
//
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = CUSTOM_CELL;
    AlarmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AlarmTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    if ([self.alarms count]) {
        NSDateFormatter * dateReader = [[NSDateFormatter alloc] init];
        [dateReader setDateFormat:@"hh:mm a"];
        AlarmObject *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
        
        BOOL enabled = currentAlarm.enabled;
        NSString *date = [dateReader stringFromDate:currentAlarm.timeToSetOff];
        
        cell.toggle.on = enabled;
        [cell.toggle addTarget:self action:@selector(toggleAlarmEnabledSwitch:) forControlEvents:UIControlEventValueChanged];
        cell.time.text = date;
    }
    
	return cell;
}

#pragma mark - Private Methods

- (void) loadData
{
    // Fetch Alarms from CoreData
    // TODO: Actually convert storage to CoreData
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *alarmListData = [defaults objectForKey:@"AlarmListData"];
    self.alarms = [NSKeyedUnarchiver unarchiveObjectWithData:alarmListData];
}

- (void) addAlarm
{
    NSLog(@"Adding alarm!");
    AddEditAlarmViewController *addAlarmVC = [[AddEditAlarmViewController alloc] initWithNibName:@"AddEditAlarmViewController" bundle:nil];
    addAlarmVC.delegate = self;
    [addAlarmVC setEditMode:NO];
    [self presentViewController:addAlarmVC animated:YES completion:nil];
}

- (void) testToggle:(id)sender
{
    UISwitch *sw = (UISwitch *)sender;
    NSLog(@"Alarm set to %@", sw.isOn ? @"on" : @"off");
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

#pragma mark - AddEditAlarmDelegate Methods

- (void) didFinishEditing
{
    [self loadData];
    [self.tableView reloadData];
}

@end


