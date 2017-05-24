//
//  PauseAnimationViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/23.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "PauseAnimationViewController.h"
#import "Chameleon.h"
#import "CALayer+AnimationControl.h"

@interface PauseAnimationViewController () {
    BOOL isPlay;
}

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIImageView *diskImageView;

@end

@implementation PauseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _diskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Disk"]];
    _diskImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 119, 100, 238, 238);
    _coverImageView = [[UIImageView alloc] init];
    _coverImageView.image = [UIImage imageNamed:@"Cover"];
    _coverImageView.bounds = CGRectMake(0, 0, 150, 150);
    _coverImageView.center = _diskImageView.center;
    [self.view addSubview:_coverImageView];
    [self.view addSubview:_diskImageView];
    
    isPlay = NO;
    
    [self startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    isPlay = !isPlay;
    if (isPlay) {
        [_coverImageView.layer ac_pause];
        [_diskImageView.layer ac_pause];
    } else {
        [_coverImageView.layer ac_resume];
        [_diskImageView.layer ac_resume];
    }
}

#pragma mark - Animation

- (void)startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.byValue = @(M_PI/2);
    animation.repeatCount = HUGE_VAL;
    animation.duration = 1;
    animation.cumulative = YES;
    animation.speed = 1;
    
    [_diskImageView.layer addAnimation:animation forKey:@"diskAnimation"];
    [_coverImageView.layer addAnimation:animation forKey:@"coverAnimation"];
}

@end
