//
//  TableViewCell.h
//  TableView
//
//  Created by Anastasiya on 16.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property NSString* nameImage;
@property NSString* textPromo;
@end
