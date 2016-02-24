//
//  BaseRootController.h
//  bici
//
//  Created by alon muroch on 24/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ECSlidingViewController.h"
#import "MACROS.h"

@interface BaseRootController : UIViewController

- (void)addPanGesture;
- (void)slideToTheRightAnimated;
- (void)conver;
- (void)imTheVisibleController;
@end
