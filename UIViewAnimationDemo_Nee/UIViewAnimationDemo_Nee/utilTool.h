//
//  utilTool.h
//  HuangProject
//
//  Created by Baoqin Huang on 2017/4/11.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface utilTool : NSObject

+ (utilTool *)sharedInstance;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
