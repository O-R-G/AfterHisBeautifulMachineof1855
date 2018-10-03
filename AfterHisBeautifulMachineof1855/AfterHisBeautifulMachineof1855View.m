//
//  AfterHisBeautifulMachineof1855View.m
//  AfterHisBeautifulMachineof1855
//
//  Created by Eric Li on 10/3/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import "AfterHisBeautifulMachineof1855View.h"

@implementation AfterHisBeautifulMachineof1855View

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    [self initValues];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    for (NSValue *pointValue in points) {
        NSPoint point = [pointValue pointValue];
        
        NSRect dotRect = NSMakeRect(point.x, point.y, dotSize, dotSize);
        
        NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:dotRect];
        
        NSColor *color = [NSColor colorWithCalibratedRed:1.0 green:0 blue:0 alpha:1.0];
        [color set];
        [path fill];
    }
    
    NSPoint lastPoint = [[points lastObject] pointValue];
    NSRect lastdotRect = NSMakeRect(lastPoint.x, lastPoint.y, dotSize, dotSize);
    NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:lastdotRect];
    NSColor *color = [NSColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    [color set];
    [path fill];
    
}

- (void)animateOneFrame
{
    theta += 0.035;
    xPos = scaler * ( sin ( xFactor * theta ) ) + size.width / 2;
    yPos = scaler * ( sin ( yFactor * theta ) ) + size.height / 2;
    
    if (counter > 3600) {
        [self initShape];
        points = [[NSMutableArray alloc] init];
    } else {
        NSPoint newPoint = NSMakePoint(xPos, yPos);
        [points addObject: [NSValue valueWithPoint:newPoint]];
        counter++;
    }
    [self setNeedsDisplay:YES];
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
    
    points = [[NSMutableArray alloc] init];
    
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
