//
//  ReviewCell.m
//  WhiteStory
//
//  Created by Admin on 02.12.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "ReviewCell.h"

@implementation ReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame {
  // frame.origin.x = frame.origin.x+45;
  //  frame.size.width = 320;
    [super setFrame:frame];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
