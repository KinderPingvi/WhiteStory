//
//  ViewController.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 14.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "iToast.h"
#import "Firebase.h"
@interface ViewController ()
{
     NSUInteger count_enroll;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.phone.mask = @"+7(###) ###-##-##";
    self.phone.delegate = self;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}
- (IBAction)nameClear:(UITextField *)sender {
    self.name.text =@"";
}

- (IBAction)phoneClear:(VMaskTextField *)sender {
    self.phone.text = @"+7";
}

- (IBAction)enrollUser:(UIButton *)sender {
    
    if(![self.name.text isEqual:@""]&& ![self.phone.text isEqual:@""])
    {
        if(self.phone.text.length<16)
        {
            [[[[iToast makeText:NSLocalizedString(@"Ошибка: Не корректный номер телефона", @"")]
               setGravity:iToastGravityBottom] setDuration:2000] show];
            
        }
        else
        {
            FIRDatabaseReference *database = [[FIRDatabase database]reference];
          
           [[database child: @"Users"] observeSingleEventOfType: FIRDataEventTypeValue withBlock: ^(FIRDataSnapshot * _Nonnull snapshot){
                    count_enroll = snapshot.childrenCount;
               
               FIRDatabaseReference *rootRef = [[FIRDatabase database] reference];
               FIRDatabaseReference *usersRef = [rootRef child:@"Users"];
               FIRDatabaseReference *projectRef = [usersRef child:[NSString stringWithFormat:@"%lu",count_enroll]];
               [projectRef setValue:@{@"name":self.name.text,@"phone":self.phone.text}];
               
               [[[[iToast makeText:NSLocalizedString(@"Заявка отправлена", @"")]
                  setGravity:iToastGravityCenter] setDuration:2000] show];
                 } withCancelBlock: ^ (NSError * _Nonnull error) {
                     NSLog (@ "%@", error.localizedDescription);
            }];
            
        }
        
        
    }
    if([self.name.text isEqual:@""]||[self.name.text isEqual:@"Полное имя"])
    {
        [[[[iToast makeText:NSLocalizedString(@"Укажите свое имя!", @"")]
           setGravity:iToastGravityBottom] setDuration:2000] show];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.name isFirstResponder] && [touch view] != self.name)
        [self.name resignFirstResponder];
    if ([self.phone isFirstResponder] && [touch view] != self.phone)
        [self.phone resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    VMaskTextField * maskTextField = (VMaskTextField*) textField;
    return  [maskTextField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
