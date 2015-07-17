//
//  WebView.h
//  week 6.GoogleMap
//  Copyright (c) 2015 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebView : UIViewController

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) WebView * webVC;
@property (retain, nonatomic) NSString * url;
@end
