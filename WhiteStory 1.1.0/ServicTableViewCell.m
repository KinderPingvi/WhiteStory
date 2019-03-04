//
//  ServicTableViewCell.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 17.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "ServicTableViewCell.h"

@implementation ServicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame {
    if(_width!=0&&_x!=0)
    {
        frame.origin.x = _x;
        frame.size.width = _width;
        [super setFrame:frame];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
