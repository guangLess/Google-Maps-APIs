
<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" />

Native iOS app with Google Maps APIs to find parks/community gardens.

Google places have stricted api usage, my api key is open here, however you can only use it for limited usages each day. Please use your own api keys. 

<img src = "/image/iOS Simulator Screen Shot Jul 17, 2015, 1.25.55 PM.png" width = 270> <img src = "image/iOS Simulator Screen Shot Jul 17, 2015, 1.07.53 PM.png" width = 270> <img src = "image/iOS Simulator Screen Shot Jul 17, 2015, 1.19.58 PM.png" width = 270> 

Depending on how the places, some non-related places keyword itself as park/garden. see the last picutre. 

AppDelegate.h GoogleMap Services APIKey:

    [GMSServices provideAPIKey:@"AIzaSyBuMSBVUHP-36h2vzQvI0zIXZ5sAtTVKMc"];

Import GoogleMap Frameworks & bundle. Manual or cocapod

Google API documents is great! 
````
-(void)gettingPins {
	  
	get the 1st layer of data {
	json api request to get a mutableArray "results".
        sort the results[]to get the sense of how the data structured, etc 
    }
    use each result[] to get 2nd layer of info{
      location
      locationID
      ..etc
    }
    use the location ID to get 3rd layer of images, openHours, reviews etc{
        
      [self.nameFin addObject:[[jsonName objectForKey:@"result"] objectForKey:@"name"]];

      [self.imageFin addObject:[[[jsonName objectForKey:@"result"] objectForKey:@"photos"][0] objectForKey:@"photo_reference"]];
    }
}
````

creating customed pins for api results from google framework

````
GMSMarker * pin = [GMSMarker markerWithPosition:position2];
        pin.title = self.nameFin[i];
        pin.map = self.mapView;
        pin.icon = [UIImage imageNamed:@"Red50.png"];
        pin.userData = self.imageFin[i];

````

CustominfoWindow is a UIView alike of google popup info view. Hopefully, it will be part of the google framework nativelly. For now, you have to create the UIView subclass programticlly. 
````
- (UIView *) mapView:(GMSMapView *) mapView markerInfoWindow:(GMSMarker *) marker  {

   CustominfoWindow * infoWindow = [[[NSBundle mainBundle]loadNibNamed:@"infoWindow" owner:self options:nil]    objectAtIndex:0]; 
   infoWindwow.name.text = marker.title;
   infoWindwow.address.text =marker.snippet;
    ...
   return infoWindow

    }
 ````


    
    

