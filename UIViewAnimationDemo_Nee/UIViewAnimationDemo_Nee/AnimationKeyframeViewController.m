//
//  AnimationKeyframeViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/19.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "AnimationKeyframeViewController.h"
#import "utilTool.h"

@interface AnimationKeyframeViewController ()

@property (nonatomic, strong) UIView *square;

@end

@implementation AnimationKeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnimationKeyframe";
    self.view.backgroundColor = [utilTool colorWithHexString:@"e5e5e5"];
    
    _square = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _square.backgroundColor = [UIColor redColor];
    [self.view addSubview:_square];
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
    CGFloat frameDuration = 1.0 / 4;
    [UIView animateKeyframesWithDuration:1.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:frameDuration animations:^{
            _square.center = CGPointMake(_square.center.x + 200, _square.center.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:frameDuration relativeDuration:frameDuration * 2 animations:^{
            _square.center = CGPointMake(_square.center.x, _square.center.y + 200);
        }];
        [UIView addKeyframeWithRelativeStartTime:frameDuration * 2 relativeDuration:frameDuration * 3 animations:^{
            _square.center = CGPointMake(_square.center.x - 200, _square.center.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:frameDuration * 3 relativeDuration:frameDuration * 4 animations:^{
            _square.center = CGPointMake(_square.center.x, _square.center.y - 200);
        }];
    } completion:^(BOOL finished) {
        
    }];
}



@end
