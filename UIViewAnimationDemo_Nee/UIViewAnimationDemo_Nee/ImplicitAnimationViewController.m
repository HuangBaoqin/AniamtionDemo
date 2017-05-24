//
//  ImplicitAnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/21.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "ImplicitAnimationViewController.h"
#import "Chameleon.h"

@interface ImplicitAnimationViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) CALayer *orangeLayer;

@end

@implementation ImplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _redView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    _redView.backgroundColor = [UIColor flatRedColor];
    
    _orangeLayer = [[CALayer alloc] init];
    _orangeLayer.frame = CGRectMake(10, 120, 100, 100);
    _orangeLayer.backgroundColor = [UIColor flatOrangeColor].CGColor;
    
    [self.view addSubview:_redView];
    [self.view.layer addSublayer:_orangeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if (CGRectContainsPoint(_redView.frame, [touch locationInView:self.view])) {
        _redView.alpha = _redView.alpha < 1 ? 1 : .2;
    }
    
    if (CGRectContainsPoint(_orangeLayer.frame, [touch locationInView:self.view])) {
        _orangeLayer.opacity = _orangeLayer.opacity < 1 ? 1 : .2;
    }
}

@end
