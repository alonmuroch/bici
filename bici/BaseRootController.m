//
//  BaseRootController.m
//  bici
//
//  Created by alon muroch on 24/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "BaseRootController.h"
#import "ECSlidingViewController.h"

@interface BaseRootController ()

@end

@implementation BaseRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addPanGesture {
    ECSlidingViewController *root = self.slidingViewController;
    [self.view addGestureRecognizer:root.panGesture];
}

- (void)slideToTheRightAnimated {
    ECSlidingViewController *root = self.slidingViewController;
    [root anchorTopViewToRightAnimated:YES];
    
    delay(root.defaultTransitionDuration, ^{
        [(BaseRootController*)root.underLeftViewController imTheVisibleController];
    });
}

- (void)conver {
    ECSlidingViewController *root = self.slidingViewController;
    [root resetTopViewAnimated:YES];
    
    delay(root.defaultTransitionDuration, ^{
        [(BaseRootController*)root.topViewController imTheVisibleController];
    });
}

- (void)imTheVisibleController { }

@end
