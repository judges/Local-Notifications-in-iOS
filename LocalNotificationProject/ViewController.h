//
//  ViewController.h
//  LocalNotificationProject
//
//  Created by Stuart Breckenridge on 12/02/2012.
//  Copyright (c) 2012 __Stuart Breckenridge__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface ViewController : UIViewController
{
    UILocalNotification *localNotification;
    
    UIButton *notifyButton;
    UIButton *removeButton;
    
    ToDoItem *item1;
}

@property (nonatomic, strong) UILocalNotification *localNotification;
@property (nonatomic, strong) IBOutlet UIButton *notifyButton;
@property (nonatomic, strong) IBOutlet UIButton *removeButton;
@property (nonatomic, strong) ToDoItem *item1;

-(IBAction)notifyButton:(id)sender; 
-(IBAction)removePressed:(id)sender;
-(void)cancelNotification;

@end
