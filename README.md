
AppDelegate.h GoogleMap Services APIKey:

    [GMSServices provideAPIKey:@"AIzaSyBuMSBVUHP-36h2vzQvI0zIXZ5sAtTVKMc"];

Import GoogleMap Frameworks & bundle. manully or cocapod

Google API documents is great! 

-(void)gettingPins {
	
	get the 1st layer of data {
	  json api request to get a mutableArray "results".
      sort the results[]to get the 1st layer of infomation of the park search. 
    }
    use each result to get 2st layer of detailed info{
      location
      locationID
    }
    use the location ID to get 3st layer of images, openHours, reviews etc{
        
        [self.nameFin addObject:[[jsonName objectForKey:@"result"] objectForKey:@"name"]];

       [self.imageFin addObject:[[[jsonName objectForKey:@"result"] objectForKey:@"photos"][0] objectForKey:@"photo_reference"]];
    }
}

creating customed pins for api results from google framework


GMSMarker * pin = [GMSMarker markerWithPosition:position2];
        pin.title = self.nameFin[i];
        pin.map = self.mapView;
        pin.icon = [UIImage imageNamed:@"Red50.png"];
        pin.userData = self.imageFin[i];


CustominfoWindow is a UIView which looks like google popup info view. Hopefully, it will be part of the google framework nativelly. 
For now, you have to create the UIView class programticlly. 

- (UIView *) mapView:(GMSMapView *) mapView
markerInfoWindow:(GMSMarker *) marker  {

CustominfoWindow * infoWindwow = [[[NSBundle mainBundle]loadNibNamed:@"infoWindow" owner:self options:nil] objectAtIndex:0]; 
 infoWindwow.name.text = marker.title;
    infoWindwow.address.text =marker.snippet;
    ...
    return 

    }

