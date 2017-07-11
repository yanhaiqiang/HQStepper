//
//  HQStepperButton.h
//  HQStepper
//
//  Created by admin on 2017/7/11.
//  Copyright © 2017年 judian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HQStepperButtonStyle) {
    HQStepperButtonStyleLeftMins,
    HQStepperButtonStyleLeftPlus,
    HQStepperButtonStyleCount
};

@interface HQStepperButton : UIButton

//默认是`UIColor darkGrayColor`
@property (nonatomic, strong) UIColor *color;
//默认是高度的%20
@property (nonatomic) CGFloat cornerRadius;

- (id)initWithFrame:(CGRect)frame style:(HQStepperButtonStyle)style;

- (void)configureAccessibilityWithTag:(NSString *)tag;
@end
