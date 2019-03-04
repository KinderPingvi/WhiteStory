//
//  ServicTableViewCell.h
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 17.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServicTableViewCell : UITableViewCell
@property CGFloat width,x;
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@property NSString* nameImage;
@property NSString* textPromo;
@end
