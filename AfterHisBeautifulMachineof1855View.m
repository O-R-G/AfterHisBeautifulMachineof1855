//
//  AfterHisBeautifulMachineof1855View.m
//  AfterHisBeautifulMachineof1855
//
//  Created by reinfurt on 8/30/09.
//  Copyright (c) 2009, __MyCompanyName__. All rights reserved.
//

#import "AfterHisBeautifulMachineof1855View.h"


@implementation AfterHisBeautifulMachineof1855View

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
	[self initValues];
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
	NSBezierPath *path;
	NSRect dotRect, dotRectStub;
	NSPoint dotPoint, dotPointStub;
	NSColor *color;
	NSRect screenRect;
	
	dotRect.size = NSMakeSize( dotSize, dotSize );
	dotRectStub.size = NSMakeSize( dotSize, dotSize );
	
	// Calculate wave, set origin
	
	theta += 0.035;
	xPos = scaler * ( sin ( xFactor * theta ) ) + size.width / 2;
	yPos = scaler * ( sin ( yFactor * theta ) ) + size.height / 2;

	// Draw leading point
	
	dotPoint.x = xPos;
	dotPoint.y = yPos;
	dotRect.origin = dotPoint;
	path = [NSBezierPath bezierPathWithOvalInRect:dotRect];
	
	color = [NSColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:0.6];
	[color set];
	
	[path fill];

	
	// Draw previous point

	if ( counter > 0 ) 
	{
		dotPointStub.x = dotPointPrevious.x;
		dotPointStub.y = dotPointPrevious.y;
		dotRectStub.origin = dotPointPrevious;
		path = [NSBezierPath bezierPathWithOvalInRect:dotRectStub];
	
		color = [NSColor colorWithCalibratedRed:1.0 green:0 blue:0 alpha:1.0];
		[color set];
	
		[path fill];
	}
		
	// Store this point for next loop
	
	dotPointPrevious = dotPoint;

	// Check number of loops and redraw shape periodically
	
	if ( counter > 3600 ) 
	{
		[self initShape];
		
		// Clear screen
		
		screenRect.size = NSMakeSize( size.width, size.height );
		color = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
		[color set];
		NSRectFill(screenRect);
	}
	else 
	{
		counter++;
	}
	
	return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void) initValues
{
	// Initialize all values, make new lissajous
		
	xPos = 0;
	yPos = 0;
	size = [self bounds].size;
	scaler = size.height / 2.2; 
	theta = 0.0;
	dotSize = size.width / 200; 
	alpha = .9;
	
	[self initShape];
	
	return;
}

- (void) initShape
{
	// Initialize a and b
	
	xFactor = SSRandomFloatBetween( 0, 2.0 );
	yFactor = SSRandomFloatBetween( 0, 2.0 );
		
	counter = 0;
	
	return;
}

@end
