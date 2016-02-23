//
//  ViewController.m
//  bici
//
//  Created by alon muroch on 23/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "ViewController.h"
#import "MACROS.h"
#import "BCBottomBar.h"
@import GoogleMaps;

@interface ViewController () {
    GMSCameraPosition *_camPosition;
    GMSMapView *_mapView;
    
    BCBottomBar *_bottomBar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _camPosition = [GMSCameraPosition cameraWithLatitude:1.285
                                                            longitude:103.848
                                                                 zoom:15];
    _mapView = [GMSMapView mapWithFrame:CGRectZero camera:_camPosition];
    _mapView.mapType = kGMSTypeNormal;
    _mapView.myLocationEnabled = YES;
    [self.view addSubview:_mapView];
    
    _bottomBar = [BCBottomBar fromXib];
    [self.view addSubview:_bottomBar];
    
    delay(1, ^{
        NSLog(@"User's location: %@", _mapView.myLocation);
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _mapView.frame = self.view.frame;
    
    CGFloat barH = self.view.frame.size.height * 0.17;
    _bottomBar.frame = CGRectMake(0,
                                  self.view.frame.size.height - barH,
                                  self.view.frame.size.width,
                                  barH);
}

@end
