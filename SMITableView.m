//
//  SMITableView.m
//  WhiteStory
//
//  Created by Admin on 28.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "SMITableView.h"
#import "CellSmiTableViewCell.h"
#import "SWRevealViewController.h"
@interface SMITableView ()

@end

@implementation SMITableView
{
    NSMutableArray* smiTitle;
    NSMutableArray* smiDetails;
    NSMutableArray* links;
    NSInteger row;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    smiTitle = [NSMutableArray arrayWithObjects:@"НашПотребНадзор",@"ModalTopical",@"Lisa.ru",@"Nastroenie.tv",nil];
    smiDetails = [NSMutableArray arrayWithObjects:@"Выступление главного врача клиники в программе",@"Интервью главного врача о клинике и спектре услуг",@"Интервью главного врача о современных методах лечения зубов",@"Главный врач рассказывает про мошенничества в стоматологиях",nil];
    links = [NSMutableArray arrayWithObjects:@"https://www.youtube.com/watch?v=mrz-_JQ1h14",@"https://drive.google.com/file/d/1nIIAYv0isIlew8jFNI_VA-a1XSA43Zi-/view?usp=sharing",@"https://lisa.ru/zvezdnyy-stomatolog-rasskazala-o-svo/?utm_source=ok&utm_campaign=lisa&utm_medium=post&utm_content=zvezdnyy-stomatolog-rasskazala-o-svo",@"http://nastroenie.tv/episode/93123",nil];
    
    /Users/admin/Downloads/WhiteStory 2.1.2/CellSmiTableViewCell.h/Users/admin/Downloads/WhiteStory 2.1.2/CellSmiTableViewCell.m/Users/admin/Downloads/WhiteStory 2.1.2/SMITableView.h/Users/admin/Downloads/WhiteStory 2.1.2/SMITableView.m
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
    return smiTitle.count;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *link = [links objectAtIndex:indexPath.row];
    NSURL *url = [ [ NSURL alloc ] initWithString: link ]; [[UIApplication sharedApplication] openURL:url];
}
-   ( CGFloat ) tableView : ( UITableView   * ) tableView  heightForRowAtIndexPath : ( NSIndexPath   * ) indexPath
{
    return   100 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyCell";
    CellSmiTableViewCell *cell = (CellSmiTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        NSArray   *nib   =   [ [ NSBundle   mainBundle ]  loadNibNamed : @"Cell"  owner :self  options :nil ] ;
        cell   =   [ nib  objectAtIndex : 0] ;
        
    }
    
    cell.title.text = [smiTitle objectAtIndex:row];
    cell.details.text = [smiDetails objectAtIndex:row];
    cell.link = [links objectAtIndex:row];
    row++;
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
