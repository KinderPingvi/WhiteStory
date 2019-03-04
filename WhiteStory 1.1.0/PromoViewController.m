//
//  PromoViewController.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 15.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "PromoViewController.h"

@interface PromoViewController ()

@end

@implementation PromoViewController
@synthesize currText,currLabel,currImg;
- (void)setDetailItem:(NSString*)image textPromo:(NSString*)text textLabel: (NSString*)label  {
    
    currImg = image;
    currLabel = label;
    currText = text;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
      [[self imagPromo]setImage:[UIImage imageNamed:currImg]];
      [[self labelPromo] setText:currLabel];
      [[self promoView]setText:currText];
        [[self textItem]setTitle:currLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)call:(UIBarButtonItem *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+74951145554"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
