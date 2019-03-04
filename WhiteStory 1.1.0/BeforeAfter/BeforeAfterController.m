//
//  BeforeAfterController.m
//  WhiteStory
//
//  Created by Admin on 01.12.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "BeforeAfterController.h"
#import "SWRevealViewController.h"
#import "BeforeAfterCell.h"
@interface BeforeAfterController ()

@end

@implementation BeforeAfterController
{
    NSArray* title;
    NSArray* img;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    title = [NSArray arrayWithObjects:@"Ультравиниры",@"Чистка зубов Zoom4",nil];
    img = [NSArray arrayWithObjects:@"do1.jpg",@"do2.jpg",nil];
}

- (IBAction)call:(UIBarButtonItem *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+74951145554"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [title count];
}
-   ( CGFloat ) tableView : ( UITableView   * ) tableView  heightForRowAtIndexPath : ( NSIndexPath   * ) indexPath
{
    return   tableView.frame.size.width-70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    BeforeAfterCell *cell = (BeforeAfterCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        NSArray   *nib   =   [ [ NSBundle   mainBundle ]  loadNibNamed : @"BeforeAfter"  owner :self  options :nil ] ;
        cell   =   [ nib  objectAtIndex : 0] ;
        
    }
    
    cell.titleL.text = [title objectAtIndex:indexPath.row];
    [cell.img setImage:[UIImage imageNamed:[img objectAtIndex:indexPath.row]]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
