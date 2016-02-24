//
//  MACROS.h
//  bici
//
//  Created by alon muroch on 23/02/2016.
//  Copyright © 2016 alon muroch. All rights reserved.
//

#ifndef MACROS_h
#define MACROS_h


static void delay(CGFloat delay, dispatch_block_t block) {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

#endif /* MACROS_h */
