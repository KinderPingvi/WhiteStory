//
//  AboutViewController.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 14.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "AboutViewController.h"
#import "SWRevealViewController.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}
- (IBAction)call:(UIBarButtonItem *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+74951145554"]];
}
-(void) viewDidAppear:(BOOL)animated{ [self.textView scrollRangeToVisible:NSMakeRange(0,0)];} - (void)viewWillAppear:(BOOL)animated{ [self.textView scrollRangeToVisible:NSMakeRange(0,0)];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
