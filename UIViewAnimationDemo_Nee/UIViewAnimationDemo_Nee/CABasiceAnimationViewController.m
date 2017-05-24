//
//  CABasiceAnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/22.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "CABasiceAnimationViewController.h"
#import "Chameleon.h"

@interface CABasiceAnimationViewController ()

@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *contentImageView;

@end

@implementation CABasiceAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    self.view.clipsToBounds = YES;
    
    _redLayer = [[CALayer alloc] init];
    _redLayer.frame = CGRectMake(10, 10, 100, 100);
    _redLayer.backgroundColor = [UIColor flatRedColor].CGColor;
    [self.view.layer addSublayer:_redLayer];
    
    _blueLayer = [[CALayer alloc] init];
    _blueLayer.frame = CGRectMake(10, 400, 50, 50);
    _blueLayer.backgroundColor = [UIColor flatSkyBlueColor].CGColor;
    [self.view.layer addSublayer:_blueLayer];
    
    
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width / 2) - 119, 150, 238, 238)];
    _bgImageView.image = [UIImage imageNamed:@"Disk"];
    
    _contentImageView = [[UIImageView alloc] init];
    _contentImageView.image = [UIImage imageNamed:@"Cover"];
    _contentImageView.bounds = CGRectMake(0, 0, 150, 150);
    _contentImageView.center = _bgImageView.center;
    
    [self.view addSubview:_contentImageView];
    [self.view addSubview:_bgImageView];
    
    
    [self basicAnimation_Additive];
    [self basicAnimation_Cumulative];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[self basicAnimation];
    //[self basicAnimation_Stay];
    [self basicAnimation_TimingFunction];
    [self handleAdditiveAnimation];
}

#pragma mark - CAAnimation methods

// 基础动画
- (void)basicAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 3;
    animation.byValue = @(250);
    
    [_redLayer addAnimation:animation forKey:@"position"];
}

// 停住动画
- (void)basicAnimation_Stay {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 3;
    animation.fromValue = @(60);
    animation.toValue = @(310);
    
    _redLayer.position = CGPointMake(310, 60);
    [_redLayer addAnimation:animation forKey:@"position"];
}

// 时间曲线-插件
- (void)basicAnimation_TimingFunction {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 3;
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints: 0.000 : 0.910 : 0.979 : 0.000];
    animation.timingFunction = timingFunction;
    animation.fromValue = @(60);
    animation.toValue = @(310);
    
    _redLayer.position = CGPointMake(310, 60);
    [_redLayer addAnimation:animation forKey:@"position"];
}

// 中途添加动画
- (void)basicAnimation_Additive {
    CABasicAnimation *animationX = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animationX.byValue = @(250);
    animationX.duration = 3.0;
    animationX.autoreverses = YES;
    animationX.repeatCount = HUGE_VAL;
    
    [_blueLayer addAnimation:animationX forKey:@"xpositionAnimation"];
}

- (void)handleAdditiveAnimation {
    CABasicAnimation *addAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    addAnimation.fromValue = @(0);
    addAnimation.toValue = @(-200);
    addAnimation.additive = YES;
    addAnimation.duration = 0.25;
    
    [_blueLayer addAnimation:addAnimation forKey:@"addAnimation"];
}

// 动画叠加
- (void)basicAnimation_Cumulative {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.byValue = @(M_PI / 2);
    animation.cumulative = YES;
    animation.repeatCount = HUGE_VAL;
    animation.duration = 0.75;
    
    [_bgImageView.layer addAnimation:animation forKey:@"bgImageAnimation"];
    [_contentImageView.layer addAnimation:animation forKey:@"contentImageAnimation"];
}

#pragma mark - handle timer

- (void)handleTimer:(NSTimer *)inTimer {
    NSLog(@"蓝色方块position === %@", NSStringFromCGPoint(_blueLayer.modelLayer.position));
}

@end
