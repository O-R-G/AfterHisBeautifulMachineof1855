//
//  AfterHisBeautifulMachineof1855View.h
//  AfterHisBeautifulMachineof1855
//
//  Created by Eric Li on 10/3/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface AfterHisBeautifulMachineof1855View : ScreenSaverView {
    // Instance variables
    
    float xFactor, yFactor, theta, alpha;
    CGFloat xPos, yPos, scaler, dotSize; //CGFloat is typedef for float, could use float instead but this seems better practice for drawing
    NSSize size;
    int counter;
    NSPoint dotPointPrevious;
    
    NSMutableArray *points;
}

// Additional (non-static) methods

- (void) initValues;
- (void) initShape;


@end
