//
//  MapViewController.h
//  week 6.GoogleMap
//  Copyright (c) 2015 9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "CustominfoWindow.h"
#import "MapViewController.h"
#import "WebView.h"

@interface MapViewController : UIViewController <GMSMapViewDelegate>

@property (retain, nonatomic)NSString * keys;
@property (retain, nonatomic)IBOutlet GMSMapView * mapView;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segCT;

@property (retain, nonatomic) NSMutableArray * finalLocationList;
@property (retain, nonatomic) NSDictionary * finalDiction;

@property (retain, nonatomic)NSMutableArray * nameFin;
@property (retain, nonatomic)NSMutableArray * addressFin;
@property (retain, nonatomic)NSMutableArray * webFin;
@property (retain, nonatomic)NSMutableArray * imageFin;


@property (retain, nonatomic)WebView * webViewVC;
@property(nonatomic,readonly,retain) UINavigationController *navigationController;

-(void)createMapPin;
-(void)gettingPins;
-(void)morePins;


@end
