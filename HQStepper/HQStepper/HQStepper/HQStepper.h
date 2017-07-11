//
//  HQStepper.h
//  HQStepper
//
//  Created by admin on 2017/7/11.
//  Copyright © 2017年 judian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQStepper : UIControl
@property (strong, nonatomic) UIColor *tintColor;
@property (assign, nonatomic) double minimumValue;
@property (assign, nonatomic) double maximumValue;
@property (assign, nonatomic) double stepValue;
@property (assign, nonatomic, getter=isContinuous) BOOL continuous;
@property (assign, nonatomic) BOOL wraps;
@property (assign, nonatomic) BOOL autorepeat;
@property (assign, nonatomic) double autorepeatInterval;
@property (copy, nonatomic) NSString *accessibilityTag;
- (void)setValue:(double)value;
- (double)value;
- (NSNumber *)valueObject;
+ (HQStepper *)stepperWithFrame:(CGRect)frame min:(CGFloat)min max:(CGFloat)max step:(CGFloat)step value:(CGFloat)value;
- (void)setFont:(NSString *)fontName size:(CGFloat)size;
- (void)setCornerRadius:(CGFloat)cornerRadius;
@end
