//
//  ViewController.m
//  bici
//
//  Created by alon muroch on 23/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "ViewController.h"
#import "BCBottomBar.h"
#import "UIView+IMG.h"
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

    self.slidingViewController.anchorRightPeekAmount = 20.0f;
    
    [self mapView];
    
    _bottomBar = [BCBottomBar fromXib];
    
    __weak typeof(self) weakSelf = self;
    _bottomBar.leftBtnPressed = ^{
        __strong typeof(self) strongSelf = weakSelf;
        
        { // to fix a bug in GMSMapView that when is slided it turns white (probably for performance)
            
            if ([strongSelf mapView].hidden) return ;
            
            UIImage *img = [[strongSelf mapView] IMG_captureImage];
            UIImageView *iv;
            if([strongSelf.view viewWithTag:1000]) {
                iv = (UIImageView*)[strongSelf.view viewWithTag:1000];
            }
            else {
                iv = [[UIImageView alloc] initWithFrame:[strongSelf mapView].frame];
                iv.tag = 1000;
                [strongSelf.view insertSubview:iv belowSubview:[strongSelf mapView]];
            }
            iv.image = img;
            [strongSelf mapView].hidden = YES;
        }
        
        [strongSelf slideToTheRightAnimated];
    };
    [self.view addSubview:_bottomBar];
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

- (GMSMapView*)mapView {
    if(!_mapView) {
        _camPosition = [GMSCameraPosition cameraWithLatitude:1.285
                                                   longitude:103.848
                                                        zoom:15];
        _mapView = [GMSMapView mapWithFrame:CGRectZero camera:_camPosition];
        _mapView.mapType = kGMSTypeNormal;
        _mapView.myLocationEnabled = YES;
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

- (void)imTheVisibleController {
    [self mapView].hidden = false;
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
