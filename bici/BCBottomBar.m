//
//  BCBottomBar.m
//  bici
//
//  Created by alon muroch on 23/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#import "BCBottomBar.h"

@interface BCBottomBar()

@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;

@end

@implementation BCBottomBar

+ (BCBottomBar*)fromXib {
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"BCBottomBar" owner:self options:nil];
    UIView *nibView = [nibObjects objectAtIndex:0];
    return (BCBottomBar*)nibView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (IBAction)btnLeftPressed:(id)sender {
    if(_leftBtnPressed)
        _leftBtnPressed();
}

- (IBAction)btnRightPressed:(id)sender {
}


@end
