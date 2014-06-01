//
//  SettingsTableViewController.m
//  WakeUpWorld
//
//  Created by Chris Blatchley on 4/21/14.
//  Copyright (c) 2014 Alex Gordon. All rights reserved.
//

#import "SettingsViewController.h"
#import "HomeViewController.h"

@interface SettingsViewController ()

@property (nonatomic, strong) IBOutlet UITableView * tableView;

- (IBAction) back:(id)sender;

@end

@implementation SettingsViewController

@synthesize charities;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.charities = [NSMutableArray arrayWithObjects:@"Amirah", @"United Way, North Shore", @"World Vision", @"Doctors Without Borders", nil];
}

- (IBAction) back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return self.charities.count;
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        [cell.textLabel setText:@"Add Credits"];
    } else {
        [cell.textLabel setText:[self.charities objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Purchase Credits" message:@"Would you like to purchase more snooze credits?" delegate:self cancelButtonTitle:@"Nevermind" otherButtonTitles:@"14 Credits: $0.99", @"28 Credits: $1.99", @"70 Credits: $4.99", nil];
        [av show];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else {
        //UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:[NSString stringWithFormat:@"%@ is grateful for your support!", [self.charities objectAtIndex:indexPath.row]] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        //[av show];
    }
}

#pragma mark - Alert view delegate

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d", buttonIndex);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *creds = [defaults valueForKey:@"AvailableCredits"];
    switch (buttonIndex) {
        case 1:
            creds = [NSNumber numberWithInt:[creds intValue] + 14];
            break;
        case 2:
            creds = [NSNumber numberWithInt:[creds intValue] + 28];
            break;
        case 3:
            creds = [NSNumber numberWithInt:[creds intValue] + 70];
            break;
        case 0:
        default:
            break;
    }
    [defaults setValue:creds forKey:@"AvailableCredits"];
    [self.homeViewController updateCredits];
}


@end
