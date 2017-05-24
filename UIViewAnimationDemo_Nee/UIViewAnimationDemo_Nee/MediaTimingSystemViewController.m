//
//  MediaTimingSystemViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/23.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "MediaTimingSystemViewController.h"
#import "Chameleon.h"

@interface MediaTimingSystemViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) CALayer *testLayer;

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIImageView *diskImageView;

@end

@implementation MediaTimingSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 8, [UIScreen mainScreen].bounds.size.width - 30, 60)];
    _timeLabel.numberOfLines = 2;
    _timeLabel.backgroundColor = [UIColor flatPurpleColor];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.text = [NSString stringWithFormat:@"系统当前时间 = %f", CACurrentMediaTime()];
    [self.view addSubview:_timeLabel];
    
    _diskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Disk"]];
    _diskImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 119, 250, 238, 238);
    _coverImageView = [[UIImageView alloc] init];
    _coverImageView.image = [UIImage imageNamed:@"Cover"];
    _coverImageView.bounds = CGRectMake(0, 0, 150, 150);
    _coverImageView.center = _diskImageView.center;
    [self.view addSubview:_coverImageView];
    [self.view addSubview:_diskImageView];
    
    [self creatLayer];
    
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
    [self diskRunAnimation];
}

#pragma mark - creat

- (void)creatLayer {
    _testLayer = [[CALayer alloc] init];
    _testLayer.frame = CGRectMake(50, 100, 100, 100);
    _testLayer.backgroundColor = [UIColor flatGrayColor].CGColor;
    [self.view.layer addSublayer:_testLayer];
}

#pragma mark - timer methods

- (void)handleTimer:(NSTimer *)inTimer {
    _timeLabel.text = [NSString stringWithFormat:@"系统当前时间 = %f \n testLayer时间 = %f", CACurrentMediaTime(), [_testLayer convertTime:CACurrentMediaTime() fromLayer:nil]];
}

#pragma mark - animations

// test timeOffSet beginTime speed
- (void)diskRunAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.byValue = @(M_PI/2);
    animation.repeatCount = HUGE_VAL;
    animation.duration = 1;
    animation.cumulative = YES;
    animation.speed = 2;
    animation.beginTime = CACurrentMediaTime() + 1;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation2.byValue = @200;
    animation2.duration = 4;
    animation2.timeOffset = 2;
    
    [_diskImageView.layer addAnimation:animation forKey:@"diskAnimation"];
    [_coverImageView.layer addAnimation:animation forKey:@"coverAnimation"];
    [_testLayer addAnimation:animation2 forKey:@"testAnimation"];
}

@end
