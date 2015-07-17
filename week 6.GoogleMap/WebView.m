//
//  WebView.m
//  week 6.GoogleMap
//  Copyright (c) 2015 9. All rights reserved.
//

#import "WebView.h"

@interface WebView ()

@end

@implementation WebView

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self ;
    [self.webView setScalesPageToFit: YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: self.url]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
