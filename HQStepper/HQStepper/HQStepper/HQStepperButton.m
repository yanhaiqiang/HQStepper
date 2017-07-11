//
//  HQStepperButton.m
//  HQStepper
//
//  Created by admin on 2017/7/11.
//  Copyright © 2017年 judian. All rights reserved.
//

#import "HQStepperButton.h"
#import "UIColor+HQStepper.h"
#import <QuartzCore/QuartzCore.h>

@interface HQStepperButton ()

@property (nonatomic) HQStepperButtonStyle style;

@property (nonatomic, strong) UIColor *currentColor;
@end

@implementation HQStepperButton
- (id)initWithFrame:(CGRect)frame style:(HQStepperButtonStyle)style {
    if (self == [super initWithFrame:frame]) {
        self.style = style;
        self.cornerRadius = 0.2f * frame.size.height;
        self.color = [UIColor darkGrayColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configureAccessibilityWithTag:(NSString *)tag {
    switch (self.style) {
        case HQStepperButtonStyleLeftMins:
            self.accessibilityLabel = [NSString stringWithFormat:@"Decrement %@ button",
                                       (tag && [tag length]) ? tag : @"stepper"];
            self.accessibilityHint = [NSString stringWithFormat:@"Decrement %@ value",
                                      (tag && [tag length]) ? tag : @"stepper"];
            break;
        case HQStepperButtonStyleLeftPlus:
            self.accessibilityLabel = [NSString stringWithFormat:@"Increment %@ button",
                                       (tag && [tag length]) ? tag : @"stepper"];
            self.accessibilityHint = [NSString stringWithFormat:@"Increment %@ value",
                                      (tag && [tag length]) ? tag : @"stepper"];
        default:
            break;
    }
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.currentColor = color;
}

- (void)setCurrentColor:(UIColor *)currentColor {
    _currentColor = currentColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    CGSize cornerRadii = CGSizeMake(self.cornerRadius, self.cornerRadius);
    UIRectCorner cornerSettings = 0;
    switch (self.style) {
        case HQStepperButtonStyleLeftMins:
            cornerSettings = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        case HQStepperButtonStyleLeftPlus:
            cornerSettings = UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        default:
            NSLog(@"Unhandled case in switch of %@", NSStringFromSelector(_cmd));
            break;
    }
    
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:cornerSettings cornerRadii:cornerRadii];
    [self.currentColor setFill];
    [roundedRectanglePath fill];
    switch (self.style) {
        case HQStepperButtonStyleLeftMins:
            [self drawMinusSymbol:rect];
            break;
        case HQStepperButtonStyleLeftPlus:
            [self drawPlusSymbol:rect];
        default:
            break;
    }
    UIGraphicsPopContext();
}

- (void)drawMinusSymbol:(CGRect)rect {
    CGFloat glyphHeight  = 0.12f * rect.size.height;
    CGFloat glyphWidth   = 0.50f * rect.size.width;
    CGFloat glyphOriginX = 0.50f * (rect.size.height - glyphWidth);
    CGFloat glyphOriginY = 0.50f * (rect.size.height - glyphHeight);
    CGRect  glyphFrame   = CGRectMake(glyphOriginX, glyphOriginY, glyphWidth, glyphHeight);
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:glyphFrame];
    [[UIColor whiteColor] setFill];
    [rectanglePath fill];
}

- (void)drawPlusSymbol:(CGRect)rect {
    CGFloat initialX   = 0.55f  * rect.size.width;
    CGFloat initialY   = 0.45f  * rect.size.height;
    CGFloat innerFar   = 0.75f * rect.size.width;
    CGFloat innerNear  = 0.25f * rect.size.width;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:    CGPointMake(initialX,  initialY)];
    [bezierPath addLineToPoint: CGPointMake(innerFar,  initialY)];
    [bezierPath addLineToPoint: CGPointMake(innerFar,  initialX)];
    [bezierPath addLineToPoint: CGPointMake(initialX,  initialX)];
    [bezierPath addLineToPoint: CGPointMake(initialX,  innerFar)];
    [bezierPath addLineToPoint: CGPointMake(initialY,  innerFar)];
    [bezierPath addLineToPoint: CGPointMake(initialY,  initialX)];
    [bezierPath addLineToPoint: CGPointMake(innerNear, initialX)];
    [bezierPath addLineToPoint: CGPointMake(innerNear, initialY)];
    [bezierPath addLineToPoint: CGPointMake(initialY,  initialY)];
    [bezierPath addLineToPoint: CGPointMake(initialY,  innerNear)];
    [bezierPath addLineToPoint: CGPointMake(initialX,  innerNear)];
    [bezierPath addLineToPoint: CGPointMake(initialX,  initialY)];
    [bezierPath closePath];
    
    [[UIColor whiteColor] setFill];
    [bezierPath fill];
}

#pragma mark -------UIControl-------
- (void)setEnabled:(BOOL)enabled {
    self.currentColor = (enabled) ? self.color : [self.color colorWithAlphaComponent:0.7];
    [super setEnabled:enabled];
}

- (void)setHighlighted:(BOOL)highlighted {
    if (![self isEnabled]) {
        return;
    }
    self.currentColor = (highlighted) ? [self.color colorDarkenedByFactor:0.3] : self.color;
    [super setHighlighted:highlighted];
}

- (void)setSelected:(BOOL)selected {
    if (![self isEnabled]) {
        return;
    }
    
    self.currentColor =  (selected) ? [self.color colorDarkenedByFactor:0.3] : self.color;
    
    [super setSelected:selected];
}


@end
