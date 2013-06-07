//
// Created by Matt Blackmon on 5/27/13.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TouchTracer.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>


@interface TouchTracer ()
@property(nonatomic, strong) UIView *tracer;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic) BOOL enableActions;
@end

@implementation TouchTracer {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        //setup tracer
        self.tracer = [[UIView alloc] initWithFrame:(CGRect){10,10,50, 50}];
        [self.tracer setBackgroundColor:[UIColor whiteColor]];
        [self.tracer.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.tracer.layer setBorderWidth:2.0];
        [self addSubview:self.tracer];
        
        self.enableActions = NO;

    }
    return self;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {

    [self updateTracer:[touch locationInView:self]];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self updateTracer:[touch locationInView:self]];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self updateTracer:[touch locationInView:self]];
}


- (void)updateTracer:(CGPoint)point {
    if (CGRectContainsPoint(self.bounds, point)){
        [UIView animateWithDuration:0.2 animations:^{
            [self.tracer setCenter:point];
            if (self.enableActions){
                UIColor* newColor = [self getColorForPoint:point];
                [self setBackgroundColor:newColor];
                [self sendActionsForControlEvents:UIControlEventValueChanged];
            }
        }];
        [self setNeedsDisplay];

    }

}

- (UIColor *)getColorForPoint:(CGPoint)point {
    CGFloat x = point.x / self.bounds.size.width;
    CGFloat y = point.y / self.bounds.size.height;
    return [UIColor colorWithRed:x green:y blue:0.0 alpha:1.0];
}


- (void)toggleWorks {
    self.enableActions = !self.enableActions;
}
@end