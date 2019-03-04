//
//  CellSmiTableViewCell.m
//  WhiteStory
//
//  Created by Admin on 28.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "CellSmiTableViewCell.h"

@implementation CellSmiTableViewCell
@synthesize   title   =   _title ;
@synthesize   details   =   _details ;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/*- (void)setFrame:(CGRect)frame {
    frame.origin.x +=15; frame.size.width -= 35 ;
    [super setFrame:frame];
    
}*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
