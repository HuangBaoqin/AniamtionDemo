//
//  TransactionViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/21.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "TransactionViewController.h"
#import "Chameleon.h"

@interface TransactionViewController ()

@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) CALayer *testLayer;

@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _square = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    _square.backgroundColor = [UIColor flatPurpleColor];
    [self.view addSubview:_square];
    
    _testLayer = [[CALayer alloc] init];
    _testLayer.frame = CGRectMake(10, 200, 100, 100);
    _testLayer.backgroundColor = [UIColor flatLimeColor].CGColor;
    [self.view.layer addSublayer:_testLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setTransaction];
}

#pragma mark - CATransaction methods

- (void)setTransaction {
    [CATransaction begin];
    
    [CATransaction setAnimationDuration:2.0];
    //_square.layer.position = CGPointMake(_square.layer.position.x + 200, _square.layer.position.y);
    [CATransaction setDisableActions:YES];
    _testLayer.position = CGPointMake(_testLayer.position.x + 200, _testLayer.position.y);
    
    [CATransaction commit];
}

@end
