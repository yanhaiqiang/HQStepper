# HQStepper
一款自定义的购物车加减按钮

![image](https://github.com/yanhaiqiang/HQStepper/blob/master/image.gif)

1.可以设置最大值与最小值，步进值，当前显示的值

[HQStepper stepperWithFrame:frame1 min:0 max:10 step:1 value:3];

2.可设置按钮圆角

[self.stepper3 setCornerRadius:20.0f];

3.设置按钮背景色

[[self.stepper2 setTintColor:[UIColor redColor];

4.设置循环

self.stepper3.wraps = YES; //循环，到最大值后返回到最小值

