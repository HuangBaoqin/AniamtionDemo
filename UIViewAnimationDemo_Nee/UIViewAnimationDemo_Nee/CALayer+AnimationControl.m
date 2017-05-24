//
//  CALayer+AnimationControl.m
//  CoreAnimationDemo
//
//  Created by Chengyin on 16/7/13.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "CALayer+AnimationControl.h"

@implementation CALayer (AnimationControl)
- (void)ac_pause
{
    CFTimeInterval localTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = localTime;
}

- (void)ac_resume
{
    CFTimeInterval lastLocalTime = self.timeOffset;
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval localTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.beginTime = localTime - lastLocalTime;
}
@end
