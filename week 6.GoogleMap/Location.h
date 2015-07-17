//
//  Location.h
//  week 6.GoogleMap
//  Copyright (c) 2015 9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
-(id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *title;
@property (readonly) NSString *place;
@property (readonly) NSNumber *latitude;
@property (readonly) NSNumber *longitude;
@property (readonly) NSString *url;
@property (readonly) NSString *information;


@end
