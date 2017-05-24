//
//  AnimationBlockViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/19.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "AnimationBlockViewController.h"
#import "utilTool.h"

@interface AnimationBlockViewController ()

@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) UIView *square2;
@property (nonatomic, strong) UIView *square3;

@end

@implementation AnimationBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnimationBlock";
    self.view.backgroundColor = [utilTool colorWithHexString:@"e5e5e5"];
    
    _square = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    _square.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_square];
    
    _square2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _square2.backgroundColor = [UIColor redColor];
    [_square addSubview:_square2];
    
    _square3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _square3.backgroundColor = [UIColor greenColor];
    [_square addSubview:_square3];
    
    _square2.hidden = YES;
    _square3.hidden = NO;
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
    
//    [UIView animateWithDuration:0.4 delay:1.0 usingSpringWithDamping:0.1 initialSpringVelocity:5.0 options:0 animations:^{
//        _square.frame = CGRectMake(50, 50, 100, 100);
//    } completion:^(BOOL finished) {
//        NSLog(@"end");
//    }];
    
//    //UIViewAnimationOptionAllowAnimatedContent 控制是否cash
//    [UIView transitionWithView:_square duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
//        _square2.hidden = !_square2.hidden;
//        _square3.hidden = !_square2.hidden;
//    } completion:^(BOOL finished) {
//        
//    }];
    
    //UIViewAnimationOptionShowHideTransitionViews 控制移除为是否Hidden操作
    UIView *fromeView = _square2.hidden ? _square3 : _square2;
    UIView *toView = _square2.hidden ? _square2 : _square3;
    [UIView transitionFromView:fromeView toView:toView duration:2.0 options:UIViewAnimationOptionTransitionCurlUp | UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
        
    }];
}

@end
