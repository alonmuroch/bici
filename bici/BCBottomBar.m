//
//  BCBottomBar.m
//  bici
//
//  Created by alon muroch on 23/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "BCBottomBar.h"

@implementation BCBottomBar

+ (BCBottomBar*)fromXib {
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"BCBottomBar" owner:self options:nil];
    UIView *nibView = [nibObjects objectAtIndex:0];
    return (BCBottomBar*)nibView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
