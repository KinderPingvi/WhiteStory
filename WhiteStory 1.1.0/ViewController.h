//
//  ViewController.h
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 14.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMaskTextField.h"
@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet VMaskTextField *phone;

@end

