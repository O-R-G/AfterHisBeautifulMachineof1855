//
//  AfterHisBeautifulMachineof1855View.h
//  AfterHisBeautifulMachineof1855
//
//  Created by reinfurt on 8/30/09.
//  Copyright (c) 2009, __MyCompanyName__. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>


@interface AfterHisBeautifulMachineof1855View : ScreenSaverView 
{
	// Instance variables
	
	float xFactor, yFactor, theta, alpha;
	CGFloat xPos, yPos, scaler, dotSize; //CGFloat is typedef for float, could use float instead but this seems better practice for drawing 
	NSSize size;
	int counter;
	NSPoint dotPointPrevious;
}

// Additional (non-static) methods

- (void) initValues;
- (void) initShape;

@end
