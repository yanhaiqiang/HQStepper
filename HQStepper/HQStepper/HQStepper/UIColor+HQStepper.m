//
//  UIColor+HQStepper.m
//  HQStepper
//
//  Created by admin on 2017/7/11.
//  Copyright © 2017年 judian. All rights reserved.
//

#import "UIColor+HQStepper.h"

@implementation UIColor (HQStepper)

- (UIColor *)colorDarkenedByFactor:(CGFloat)factor {
    CGFloat *currentColorComponents = (CGFloat *)CGColorGetComponents([self CGColor]);
    CGFloat newColorComponents[4];
    NSInteger nComponents = CGColorGetNumberOfComponents([self CGColor]);
    switch (nComponents) {
        case 2: {
            newColorComponents[0] = currentColorComponents[0] * (1.0f - factor);
            newColorComponents[1] = currentColorComponents[0] * (1.0f - factor);
            newColorComponents[2] = currentColorComponents[0] * (1.0f - factor);
            newColorComponents[3] = currentColorComponents[1];
            break;
        }
        case 4: { // RGBA
            newColorComponents[0] = currentColorComponents[0] * (1.0f - factor);
            newColorComponents[1] = currentColorComponents[1] * (1.0f - factor);
            newColorComponents[2] = currentColorComponents[2] * (1.0f - factor);
            newColorComponents[3] = currentColorComponents[3];
            break;
        }
        default: {
            NSLog(@"Unhandled case in UIColor+FMStepperAdditions: %@", NSStringFromSelector(_cmd));
            return self;
        }
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newColorComponents);
    CGColorSpaceRelease(colorSpace);
    
    UIColor *returnedColor = [UIColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
    
    return returnedColor;
}

@end
