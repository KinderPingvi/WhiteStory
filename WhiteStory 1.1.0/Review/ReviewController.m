//
//  ReviewController.m
//  WhiteStory
//
//  Created by Admin on 02.12.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "ReviewController.h"
#import "SWRevealViewController.h"
#import "ReviewCell.h"
@interface ReviewController ()

@end

@implementation ReviewController
{
    NSArray* images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    images = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",nil];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [images count];
}

-   ( CGFloat ) tableView : ( UITableView   * ) tableView  heightForRowAtIndexPath : ( NSIndexPath   * ) indexPath
{
    return   295;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ReviewCell *cell = (ReviewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        NSArray   *nib   =   [ [ NSBundle   mainBundle ]  loadNibNamed : @"ReviewCell"  owner :self  options :nil ] ;
        cell   =   [ nib  objectAtIndex : 0] ;
        
    }
    [cell.img setImage:[UIImage imageNamed:[images objectAtIndex:indexPath.row]]];
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
