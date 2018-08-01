//
//  ViewController.m
//  HQStepper
//
//  Created by admin on 2017/7/11.
//  Copyright © 2017年 judian. All rights reserved.
//

#import "ViewController.h"
#import "HQStepper.h"

@interface ViewController ()

@property (nonatomic, strong) HQStepper *stepper1;
@property (nonatomic, strong) HQStepper *stepper2;
@property (nonatomic, strong) HQStepper *stepper3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    // Stepper 1: All defaults
    CGFloat controlWidth1 = 79.0f;
    CGFloat controlHeight1 = 27.0f;
    
    CGFloat xPos1 = (0.5 * screenWidth) - (0.5 * controlWidth1);
    CGFloat yPos1 = (0.25 * screenHeight) - (0.5 * controlHeight1);
    CGRect frame1 = CGRectMake(xPos1, yPos1, controlWidth1, controlHeight1);
    self.stepper1 = [HQStepper stepperWithFrame:frame1 min:0 max:10 step:1 value:3];
    [self.stepper1 setAccessibilityTag:@"random"];
    [self.stepper1 addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.stepper1];
    
    //Stepper2
    CGFloat controlWidth2 = 109.0f;
    CGFloat controlHeight2 = 32.0f;
    
    CGFloat xPos2 = (0.5 * screenWidth)  - (.5 * controlWidth2);
    CGFloat yPos2 = (0.5 * screenHeight)  - (.5 * controlHeight2);
    CGRect frame2 = CGRectMake(xPos2, yPos2, controlWidth2, controlHeight2);
    self.stepper2 = [HQStepper stepperWithFrame:frame2 min:0.0f max:100.0f step:5.0f value:50.0f];
    [self.stepper2 setFont:@"HelveticaNeue-Light" size:24.0f];
    UIColor *cardinal = [UIColor colorWithRed:(108/255.0f) green:(22/255.0f) blue:(31/255.0f) alpha:1.0];
    [self.stepper2 setTintColor:cardinal];
    [self.stepper2 setCornerRadius:0.0f];
    [self.stepper2 setAccessibilityTag:@"Cardinal"];
    [self.stepper2 addTarget:self
                      action:@selector(stepperChanged:)
            forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.stepper2];
    
    // Stepper 3: Blue color, very round corners, wraps around
    CGFloat controlWidth3 = 180.0f;
    CGFloat controlHeight3 = 60.0f;
    CGFloat xPos3 = (0.5 * screenWidth)  - (.5 * controlWidth3);
    CGFloat yPos3 = (0.75 * screenHeight)  - (.5 * controlHeight3);
    CGRect frame3 = CGRectMake(xPos3, yPos3, controlWidth3, controlHeight3);
    
    self.stepper3 = [HQStepper stepperWithFrame:frame3 min:0.0f max:5.0f step:1.0f value:1.0f];
    self.stepper3.wraps = YES; //循环，到最大值后返回到最小值
    [self.stepper3 setAccessibilityTag:@"Blue"];
    [self.stepper3 setTintColor:[UIColor greenColor]];
    [self.stepper3 setCornerRadius:20.0f];
    [self.stepper3 addTarget:self
                      action:@selector(stepperChanged:)
            forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.stepper3];
}

- (void)stepperChanged:(id)sender
{
    if (![sender isMemberOfClass:[HQStepper class]]) {
        NSLog(@"%@ expected an `FMStepper' as sender but got a(n) `%@'. How confusing!",
              NSStringFromSelector(_cmd), NSStringFromClass([sender class]));
        return;
    }
    
    HQStepper *stepper = (HQStepper *)sender;
    CGFloat value = [stepper value];
    
    if (stepper == self.stepper1) {
        NSLog(@"self.stepper1 has value %f", value);
    } else if (stepper == self.stepper2) {
        NSLog(@"self.stepper2 has value %f", value);
    } else if (stepper == self.stepper3) {
        NSLog(@"self.stepper3 has value %f", value);
    } else {
        NSLog(@"Weird. I've never heard of this stepper: %@", stepper);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
