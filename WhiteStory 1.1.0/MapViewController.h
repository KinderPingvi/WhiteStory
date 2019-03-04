//
//  MapViewController.h
//  Tech-fit01
//
//  Created by Anastasiya on 28.10.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController : UIViewController {
 
    __weak IBOutlet UIBarButtonItem *sidebarItem;
    __weak IBOutlet UIView *ViewMap;
    __weak IBOutlet GMSMapView *mapView;

}
@end
