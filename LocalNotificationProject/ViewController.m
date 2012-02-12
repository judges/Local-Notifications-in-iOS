//
//  ViewController.m
//  LocalNotificationProject
//
//  Created by Stuart Breckenridge on 12/02/2012.
//  Copyright (c) 2012 __Stuart Breckenridge__. All rights reserved.
//

#import "ViewController.h"
#define ToDoItemKey @"EVENTKEY1" 

@implementation ViewController

@synthesize localNotification = localNotif;
@synthesize notifyButton = _notifyButton;
@synthesize item1 = _item1;
@synthesize removeButton = _removeButton;

#pragma mark - Scheduling the Event

// This schedules the notification with the ToDoItem created when the Notify Button is pressed. 
- (void)scheduleNotificationWithItem:(ToDoItem *)item interval:(int)minutesBefore 
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:item.day];
    [dateComps setMonth:item.month];
    [dateComps setYear:item.year];
    [dateComps setHour:item.hour];
    [dateComps setMinute:item.minute];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    //[dateComps release]; - this is not required in ARC.
    
    localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [itemDate dateByAddingTimeInterval:(minutesBefore*60)];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ in %i minutes.", nil),
                            item.eventName, minutesBefore];
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:ToDoItemKey];
    localNotif.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    // [localNotif release]; - this is not required in ARC.
    
    NSLog(@"Item Date: %@", itemDate);
    NSLog(@"Fire Date: %@", localNotif.fireDate);
}

//This method is used to decrease the app badge count by 1.
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notif 
{
    application.applicationIconBadgeNumber = notif.applicationIconBadgeNumber-1;
}

//This method is called when the cancel notification button is pressed. 
-(void)cancelNotification
{
    if(localNotif || [UIApplication sharedApplication].applicationIconBadgeNumber > 0)//If there is a local notification item in existence it will be call this method.
    {
        [self application:[UIApplication sharedApplication] didReceiveLocalNotification:localNotif];
        NSLog(@"Local Notification Cancelled");
    }
    else //If there is no local notification an AlertView will be shown to let the user know. 
        {
            UIAlertView *noNotif = [[UIAlertView alloc] initWithTitle:@"No Notification" message:@"There are no notifications to cancel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [noNotif show];
        }
}

#pragma mark - Interface methods

//Called when the create notification button is pressed. 
-(IBAction)notifyButton:(id)sender
{
    _item1 = [[ToDoItem alloc] init]; // Create the ToDoItem - see the ToDoItem class.
    NSCalendar *calendar1 = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComps1 = [[NSDateComponents alloc] init];
    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSYearCalendarUnit;
    
    dateComps1 = [calendar1 components:unitFlags fromDate:[NSDate date]];
    
    _item1.year = [dateComps1 year];
    _item1.month = [dateComps1 month];
    _item1.day = [dateComps1 day];
    _item1.hour = [dateComps1 hour];
    _item1.minute = [dateComps1 minute];
    _item1.eventName = @"Test Notification";
    
    [self scheduleNotificationWithItem:_item1 interval:1]; //Change the interval amount to increase the notification appearance by X minutes
    
    NSString *fireString = [NSString stringWithFormat:@"A notification will show at %@", localNotif.fireDate];
    
    UIAlertView *fireTime = [[UIAlertView alloc] initWithTitle:@"Notification Set" message:fireString delegate:nil cancelButtonTitle:@"Super" otherButtonTitles:nil, nil];
    [fireTime show];
     
}

//Called when the cancel notification button is pressed.
-(IBAction)removePressed:(id)sender
{
    [self cancelNotification];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
