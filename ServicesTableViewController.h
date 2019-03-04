//
//  ServicesTableViewController.h
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 16.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServicesTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property NSArray* textSection;
@property NSArray* imgSection;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSArray* allSection;
@end
