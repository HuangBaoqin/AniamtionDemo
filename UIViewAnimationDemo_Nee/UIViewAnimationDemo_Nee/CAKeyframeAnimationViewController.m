//
//  CAKeyframeAnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/25.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"
#import "Chameleon.h"

static const CGFloat MOON_RADIUS = 300.0;
static const CGFloat CAR_WIDTH = 60.0;
static const CGFloat CAR_HEIGHT = 30.0;
static const CGFloat DEG_RAD = M_PI / 180;

@interface CAKeyframeAnimationViewController ()

@property (nonatomic, strong) UIImageView *moonImageView;
@property (nonatomic, strong) UIImageView *carImageView;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _moonImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - MOON_RADIUS / 2, 100, MOON_RADIUS, MOON_RADIUS)];
    _moonImageView.image = [UIImage imageNamed:@"moon"];
    [self.view addSubview:_moonImageView];
    
    _carImageView = [[UIImageView alloc] init];
    _carImageView.bounds = CGRectMake(0, 0, CAR_WIDTH, CAR_HEIGHT);
    _carImageView.center = CGPointMake(_moonImageView.center.x, _moonImageView.center.y - MOON_RADIUS / 2);
    _carImageView.image = [UIImage imageNamed:@"car"];
    [self.view addSubview:_carImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addRunMoonAnimation];
}

#pragma mark - Animation Methods

- (void)addRunMoonAnimation {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:_carImageView.center];
    [bezierPath addArcWithCenter:_moonImageView.center radius:MOON_RADIUS / 2 startAngle:- 90 * DEG_RAD endAngle:270 * DEG_RAD clockwise:YES];
    [bezierPath closePath];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = bezierPath.CGPath;
    animation.repeatCount = HUGE_VALF;
    animation.duration = 4.0;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.calculationMode = kCAAnimationPaced;
    
    [_carImageView.layer addAnimation:animation forKey:animation.keyPath];
}

@end
