//
//  PromoTableViewController.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 15.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "PromoTableViewController.h"
#import "PromoViewController.h"
#import "TableViewCell.h"
#import "SWRevealViewController.h"
@interface PromoTableViewController ()
@property NSMutableArray *labelPromo;
@property NSMutableArray *imageName;
@property NSMutableArray *textPromo;
@end

@implementation PromoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageName = [NSMutableArray arrayWithObjects :@"7.jpg",nil];
    _textPromo = [NSMutableArray arrayWithObjects: @"Только у нас сертификат качества, гарантия, без обработки зубов за 2 посещения вы получаете белоснежную улыбку своей мечты.\r\nСпециалист по эстетике - Тихонова Татьяна Георгиевная",nil];
    _labelPromo = [NSMutableArray arrayWithObjects:@"Скидка на ультравиниры 10%", nil];
    [self.navigationItem.backBarButtonItem setTitle:@""];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_labelPromo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    //Поиск ячейки
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    
    cell.labelText.text = [_labelPromo objectAtIndex:indexPath.row];
    cell.nameImage = [_imageName objectAtIndex:indexPath.row];
    cell.textPromo = [_textPromo objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PromoViewController *controller = (PromoViewController *)[segue destinationViewController];
        [controller setDetailItem:[_imageName objectAtIndex:indexPath.row] textPromo:[_textPromo objectAtIndex:indexPath.row] textLabel:[_labelPromo objectAtIndex:indexPath.row]];
       /* [[controller imagPromo] setImage:[UIImage imageNamed:[_imageName objectAtIndex:indexPath.row]]];
        [[controller labelPromo] setText: [_labelPromo objectAtIndex:indexPath.row]];
        [[controller promoView] setText:[_textPromo objectAtIndex:indexPath.row]];*/
       /* controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;*/
    }
}

@end
