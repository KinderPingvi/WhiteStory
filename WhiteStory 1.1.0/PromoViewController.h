//
//  PromoViewController.h
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 15.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagPromo;
@property (weak, nonatomic) IBOutlet UILabel *labelPromo;
@property (weak, nonatomic) IBOutlet UITextView *promoView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UINavigationItem *textItem;
@property NSString* currImg;
@property NSString* currLabel;
@property NSString* currText;
- (void)setDetailItem:(NSString*)image textPromo:(NSString*)text textLabel: (NSString*)label ;
@end
