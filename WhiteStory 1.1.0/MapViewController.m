//
//  MapViewController.m
//  Tech-fit01
//
//  Created by Anastasiya on 28.10.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import"SWRevealViewController.h"
@interface MapViewController ()

@end

@implementation MapViewController
{
    UIImageView * mark;
}

- (IBAction)call:(UIBarButtonItem *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+74951145554"]];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self->sidebarItem setTarget: self.revealViewController];
        [self->sidebarItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:55.7627213
                                                            longitude:37.6003562 zoom: 17];
    
    [mapView animateToCameraPosition:camera];
    GMSMarker *marker = [ [GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(55.7627213, 37.6003562);
    marker.title = @"White Stoty";
    marker.snippet = @"г.Москва, ул. Большая Бронная 17";
    marker.map = mapView;
    ViewMap = mapView;
    
    
    [self roundMyView:ViewMap borderRadius:10.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)roundMyView:(UIView*)view
       borderRadius:(CGFloat)radius
{
    CALayer *layer = [view layer];
    layer.masksToBounds = YES;
    layer.cornerRadius = radius;
   
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
