//
//  CellSmiTableViewCell.h
//  WhiteStory
//
//  Created by Admin on 28.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellSmiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *details;
@property NSString* link;

@end
