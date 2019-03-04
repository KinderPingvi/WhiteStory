//
//  PromoTableViewController.h
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 15.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromoViewController.h"
@interface PromoTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *promoLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) PromoViewController *detailViewController;
@end
