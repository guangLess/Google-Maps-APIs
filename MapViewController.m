//
//  MapViewController.m
//  week 6.GoogleMap
//
//  Copyright (c) 2015 9. All rights reserved.



//AIzaSyAj7RGR-H1kRocQM0wBfKPZeZZD8B0Pk34  brower Key
/*//maps.googleapis.com/maps/api/place/radarsearch/json?location=40.739564,-73.991524&radius=5000&types=parks&key=AIzaSyAj7RGR-H1kRocQM0wBfKPZeZZD8B0Pk34
 
ttps://maps.googleapis.com/maps/api/place/radarsearch/json?location=40.739564,-73.991524&radius=5000&types=food|cafe&keyword=vegetarian&key=AIzaSyAj7RGR-H1kRocQM0wBfKPZeZZD8B0Pk34
parks-- ttps://maps.googleapis.com/maps/api/place/radarsearch/json?location=40.739564,-73.991524&radius=5000&types=park&key=AIzaSyAj7RGR-H1kRocQM0wBfKPZeZZD8B0Pk34
 
 */

#import "MapViewController.h"


@interface MapViewController ()
@end

@implementation MapViewController{

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMapPin];
    [self gettingPins];
    [self morePins];
}

-(void)createMapPin{
    
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake (40.739564, -73.991524); //40.8000975,-73.9780189,14
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:position zoom:15];
    self.mapView.camera = camera; // assign camera to the mapView.
    
    self.mapView.delegate = self;
    GMSMarker * ttt = [GMSMarker markerWithPosition:position];
    ttt.title = @"Turn To Tech";
    ttt.icon = [UIImage imageNamed:@"tree2.png"];
    ttt.map = self.mapView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)segmentAction:(id)sender {
    
    self.segCT = [[UISegmentedControl alloc] init];

    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = kGMSTypeSatellite;
            break;
        case 1:
            self.mapView.mapType = kGMSTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = kGMSTypeTerrain;
            break;
        case 3:
            self.mapView.mapType = kGMSTypeTerrain;
        default:
            break;
    }
}

-(void)gettingPins{

    //self.keys = @"AIzaSyAj7RGR-H1kRocQM0wBfKPZeZZD8B0Pk34"; first key
    self.keys=@"AIzaSyDqvPS3qIUQPcqB399T4e8cJ2opQILrfZc";
    //NSString * url_s = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/radarsearch/json?location=40.739564,-73.991524&radius=1000&types=park|garden&keyword=communitygarden|playground&key=%@",self.keys]; // 2000 radians
    
    NSString * url_s = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/radarsearch/json?location=40.739564,-73.991524&radius=1000&types=park|garden&key=%@",self.keys];
    NSURL * url_1 = [NSURL URLWithString:[url_s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url_1];
    

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *jsonD = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    NSMutableArray *array = [jsonD objectForKey:@"results"];
    //NSLog(@" testing %@", [diction objectForKey:@"geometry"]);
    
    NSMutableArray * singleD = [[NSMutableArray alloc]init];
    NSMutableArray * placeID = [[NSMutableArray alloc] init];
    self.finalLocationList = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < array.count ; i++){
        NSDictionary * dictionA = [array objectAtIndex:i];
        
        [singleD addObject:[[dictionA objectForKey:@"geometry"] objectForKey:@"location" ]];
        [placeID addObject:[dictionA objectForKey:@"place_id"]];
        self.finalLocationList = singleD;
    }
    NSLog(@"placeID %lu",(unsigned long)placeID.count);
    NSLog(@"%lu", (unsigned long)self.finalLocationList.count);
    
   
    self.nameFin = [[NSMutableArray alloc] init];
    self.addressFin = [[NSMutableArray alloc] init];
    self.webFin = [[NSMutableArray alloc] init];
    self.imageFin = [[NSMutableArray alloc] init];


    for (int i = 0 ; i < array.count ; i++){
        //NSString * namePick = placeID[3];
        NSString * namePark = placeID[i];
        //NSString * namePark = @"ChIJU4Qt74xYwokRGhgxDyXagEU";
        self.keys=@"AIzaSyDqvPS3qIUQPcqB399T4e8cJ2opQILrfZc";;
        NSString * nameURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/details/json?placeid=%@&key=%@",namePark,self.keys];
        NSURL * url_2 = [NSURL URLWithString:[nameURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURLRequest * requestName = [NSURLRequest requestWithURL:url_2];
     
        NSData *responese_name = [NSURLConnection sendSynchronousRequest:requestName returningResponse:nil error:nil];
        NSDictionary *jsonName = [NSJSONSerialization JSONObjectWithData:responese_name options:0 error:nil];

        [self.nameFin addObject:[[jsonName objectForKey:@"result"] objectForKey:@"name"]];
        [self.addressFin addObject:[[jsonName objectForKey:@"result"]objectForKey:@"vicinity"]];//formatted_address
        
        if ([[[jsonName objectForKey:@"result"] objectForKey:@"photos"][0] objectForKey:@"photo_reference"] == NULL){
            [self.imageFin addObject:@"No Image"];
        } else {
            
            [self.imageFin addObject:[[[jsonName objectForKey:@"result"] objectForKey:@"photos"][0] objectForKey:@"photo_reference"]];
        }
        
        //NSLog(@"%i, %@", i,[[[jsonName objectForKey:@"result"] objectForKey:@"photos"][0] objectForKey:@"photo_reference"] );
        //wawza !!
        //[photoID addObject:[[jsonName objectForKey:@"result"] objectForKey:@"photos"]];
        //NSLog(@" name ====== %@", [[jsonName objectForKey:@"result"] objectForKey:@"name"]);
       // NSLog(@" %i name === %@ ", i,self.nameFin[i]);
        
    }
        NSLog(@" %@", self.imageFin);
}

-(void)morePins {
    
    NSMutableArray * finLa = [[NSMutableArray alloc] init];
    NSMutableArray * finLn = [[NSMutableArray alloc] init];
    
    for ( int i = 0; i < self.finalLocationList.count ; i++){
    self.finalDiction = [[ NSDictionary alloc]init];
    [finLa addObject :[self.finalLocationList[i] objectForKey:@"lat"]];
    [finLn addObject:[self.finalLocationList[i] objectForKey:@"lng"]];
        
        CLLocationCoordinate2D position2 = CLLocationCoordinate2DMake([finLa[i] doubleValue], [finLn[i] doubleValue]);
        GMSMarker * pin = [GMSMarker markerWithPosition:position2];
        pin.title = self.nameFin[i];
        pin.map = self.mapView;
        pin.icon = [UIImage imageNamed:@"Red50.png"];
        pin.userData = self.imageFin[i];
    }
}

- (UIView *) mapView:(GMSMapView *) mapView
markerInfoWindow:(GMSMarker *) marker  {
    NSLog( @" %@ ", self.nameFin);
    self.keys=@"AIzaSyDqvPS3qIUQPcqB399T4e8cJ2opQILrfZc";
    
    CustominfoWindow * infoWindwow = [[[NSBundle mainBundle]loadNibNamed:@"infoWindow" owner:self options:nil] objectAtIndex:0];
    infoWindwow.name.text = marker.title;
    infoWindwow.address.text =marker.snippet;
    NSString * url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=%@",marker.userData,self.keys];
    NSURL *imageUrl = [NSURL URLWithString:url];
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage * image = [UIImage imageWithData:imageData];
    infoWindwow.photo.image = image;
    return infoWindwow;
}

@end
