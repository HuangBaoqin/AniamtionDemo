//
//  AnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/19.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "AnimationViewController.h"
#import "utilTool.h"

@interface AnimationViewController ()

@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) UIView *square2;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnimationView";
    self.view.backgroundColor = [utilTool colorWithHexString:@"e5e5e5"];
    
    _square = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    _square.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_square];
    
    _square2 = [[UIView alloc] initWithFrame:CGRectMake(50, 160, 100, 100)];
    _square2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_square2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self startAnimation];
}

#pragma mark - Animation methods

- (void)startAnimation {
    //Animation1
    [UIView beginAnimations:@"squareAnimation" context:(__bridge void *)self];
    
    [UIView setAnimationDuration:.8];
    _square.center = CGPointMake(_square.center.x + 200, _square.center.y);
    
    [UIView commitAnimations];
    
    //Animation2
    [UIView beginAnimations:@"squareAnimation2" context:(__bridge void *)self];
    
    [UIView setAnimationDuration:.8];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    _square2.center = CGPointMake(_square2.center.x + 200, _square2.center.y);
    
    [UIView commitAnimations];
}

@end
