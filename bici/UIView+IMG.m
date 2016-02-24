//
//  UIView+IMG.m
//  bici
//
//  Created by alon muroch on 24/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "UIView+IMG.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (IMG)

- (UIImage*)IMG_captureImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
