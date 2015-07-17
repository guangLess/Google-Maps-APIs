//
//  AppDelegate.h
//  week 6.GoogleMap
//
//  Created by Aditya Narayan on 1/30/15.
//  Copyright (c) 2015 9. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MapViewController * mapViewController;
@property(strong, nonatomic) UINavigationController *navigationController;



@end

