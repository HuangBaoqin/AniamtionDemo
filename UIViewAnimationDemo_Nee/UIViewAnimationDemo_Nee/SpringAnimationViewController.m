//
//  SpringAnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/24.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "SpringAnimationViewController.h"
#import "Chameleon.h"

@interface SpringAnimationViewController ()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UITextField *massTextField;
@property (nonatomic, strong) UITextField *initialVelocityTextField;
@property (nonatomic, strong) UITextField *dampingTextField;
@property (nonatomic, strong) UITextField *stiffnessTextField;
@property (nonatomic, strong) UIButton *addAnimationButton;

@end

@implementation SpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(100, 10, 20, 100)];
    _testView.backgroundColor = [UIColor flatRedColor];
    _testView.center = CGPointMake(150, _testView.center.y);
    [self.view addSubview:_testView];
    
    _massTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 180, 44)];
    _massTextField.backgroundColor = [UIColor whiteColor];
    _massTextField.placeholder = @"mass > 0, 1";
    [self.view addSubview:_massTextField];
    
    _initialVelocityTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, _massTextField.frame.origin.y + 44 + 10, 180, 44)];
    _initialVelocityTextField.backgroundColor = [UIColor whiteColor];
    _initialVelocityTextField.placeholder = @"0";
    [self.view addSubview:_initialVelocityTextField];
    
    _dampingTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, _initialVelocityTextField.frame.origin.y + 44 + 10, 180, 44)];
    _dampingTextField.backgroundColor = [UIColor whiteColor];
    _dampingTextField.placeholder = @"damping >= 0, 10";
    [self.view addSubview:_dampingTextField];
    
    _stiffnessTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, _dampingTextField.frame.origin.y + 44 + 10, 180, 44)];
    _stiffnessTextField.backgroundColor = [UIColor whiteColor];
    _stiffnessTextField.placeholder = @"stiffness > 0, 100";
    [self.view addSubview:_stiffnessTextField];
    
    _addAnimationButton = [[UIButton alloc] initWithFrame:CGRectMake(20, _stiffnessTextField.frame.origin.y + 44 + 10, [UIScreen mainScreen].bounds.size.width - 40, 44)];
    [_addAnimationButton setBackgroundColor:[UIColor flatForestGreenColor]];
    [_addAnimationButton setTitle:@"add animation" forState:UIControlStateNormal];
    [_addAnimationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addAnimationButton addTarget:self action:@selector(handleAddAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addAnimationButton];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100 + 100 + 10, 120 + 22 - 15, 100, 30)];
    label1.text = @"mass";
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100 + 100 + 10, 120 + 22 - 15 + 24 + 30, 100, 30)];
    label2.text = @"velocity";
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(100 + 100 + 10, 120 + 22 - 15 + 24 * 2 + 30 * 2, 100, 30)];
    label3.text = @"damping";
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(100 + 100 + 10, 120 + 22 - 15 + 24 * 3 + 30 * 3, 100, 30)];
    label4.text = @"stiffness";
    [self.view addSubview:label4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testSpringAnimation];
}

- (void)handleAddAnimation:(id)sender {
    if ([_massTextField.text isEqualToString:@""] || [_initialVelocityTextField.text isEqualToString:@""] || [_dampingTextField.text isEqualToString:@""] || [_stiffnessTextField.text isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"参数不完整" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertController animated:YES completion:^{
            
        }];
    } else {
        [self testAnimationWithMass:_massTextField.text.floatValue
                        andVelocity:_initialVelocityTextField.text.floatValue
                         andDamping:_dampingTextField.text.floatValue
                       andStiffness:_stiffnessTextField.text.floatValue];
    }
}

#pragma mark - Animations

- (void)testSpringAnimation {
    
    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"bounds"];
    CGRect rect = CGRectMake(0, 0, 20, 100);
    animation.fromValue = [NSValue valueWithCGRect:rect];
    rect = CGRectMake(0, 0, 100, 100);
    animation.toValue = [NSValue valueWithCGRect:rect];
    
    animation.duration = animation.settlingDuration;
    
    _testView.bounds = rect;
    [_testView.layer addAnimation:animation forKey:animation.keyPath];
    
}

- (void)testAnimationWithMass:(CGFloat)inMass
                  andVelocity:(CGFloat)inVelocity
                   andDamping:(CGFloat)inDamping
                 andStiffness:(CGFloat)inStiffness {
    
    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"bounds"];
    
    CGRect rect = CGRectMake(0, 0, 20, 100);
    animation.fromValue = [NSValue valueWithCGRect:rect];
    rect = CGRectMake(0, 0, 100, 100);
    animation.toValue = [NSValue valueWithCGRect:rect];
    
    animation.initialVelocity = inVelocity;
    animation.mass = inMass;
    animation.damping = inDamping;
    animation.stiffness = inStiffness;
    
    animation.duration = animation.settlingDuration;
    
    _testView.bounds = rect;
    [_testView.layer addAnimation:animation forKey:animation.keyPath];
    
}

@end
