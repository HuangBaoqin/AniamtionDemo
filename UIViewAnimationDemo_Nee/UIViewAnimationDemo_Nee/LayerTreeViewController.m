//
//  LayerTreeViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/21.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "LayerTreeViewController.h"
#import "Chameleon.h"

@interface LayerTreeViewController ()

@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation LayerTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor flatSandColor];
    
    _square = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    _square.backgroundColor = [UIColor flatPurpleColor];
    [self.view addSubview:_square];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _square.center = CGPointMake(60, 60);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self startTimer];
    [UIView animateWithDuration:3.0 animations:^{
        _square.center = CGPointMake(_square.center.x + 200, _square.center.y);
    } completion:^(BOOL finished) {
        [_timer invalidate];
    }];
}

#pragma mark - timer methods

- (void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}

- (void)timer:(NSTimer *)inTimer {
    CGFloat modelCenterX = ((CALayer *)[_square.layer modelLayer]).position.x;
    CGFloat presentationCenterX = ((CALayer *)[_square.layer presentationLayer]).position.x;
    NSLog(@"model === %.4f, presentation === %.4f", modelCenterX, presentationCenterX);
}

@end
