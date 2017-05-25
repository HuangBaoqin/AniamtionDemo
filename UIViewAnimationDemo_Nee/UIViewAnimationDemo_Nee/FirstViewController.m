//
//  FirstViewController.m
//  UIViewAnimationDemo_Nee
//
//  Created by Baoqin Huang on 2017/5/19.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "FirstViewController.h"

#import "AnimationViewController.h"
#import "AnimationBlockViewController.h"
#import "AnimationKeyframeViewController.h"
#import "ImplicitAnimationViewController.h"
#import "LayerTreeViewController.h"
#import "TransactionViewController.h"
#import "CABasiceAnimationViewController.h"
#import "MediaTimingSystemViewController.h"
#import "PauseAnimationViewController.h"
#import "SpringAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"

#import "Chameleon.h"
#import "utilTool.h"

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *sections;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor flatPurpleColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor flatPurpleColor];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 8) style:UITableViewStyleGrouped];
    _mainTableView.backgroundColor = [UIColor clearColor];
    
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    _nameArray = @[@[@"UIView_Animation", @"UIView_AnimationWithBlocks", @"UIView_KeyframeAnimations"], @[@"隐式动画", @"动画过程的Layer树", @"Transaction", @"CABasiceAnimation", @"时间系统", @"暂停动画", @"弹簧动画", @"CA关键帧动画", @"..."]];
    _sections = @[@"UIViewAnimation", @"CoreAnimation"];
    
    [self.view addSubview:_mainTableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableView delegate && dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[_nameArray objectAtIndex:section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    header.backgroundColor = [UIColor flatPurpleColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor flatGrayColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text = [_sections objectAtIndex:section];
    [header addSubview:titleLabel];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"animationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor flatGrayColor];
    cell.textLabel.text = [((NSArray *)[_nameArray objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self.navigationController pushViewController:[AnimationViewController new] animated:YES];
                break;
            case 1:
                [self.navigationController pushViewController:[AnimationBlockViewController new] animated:YES];
                break;
            case 2:
                [self.navigationController pushViewController:[AnimationKeyframeViewController new] animated:YES];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                [self.navigationController pushViewController:[ImplicitAnimationViewController new] animated:YES];
                break;
            case 1:
                [self.navigationController pushViewController:[LayerTreeViewController new] animated:YES];
                break;
            case 2:
                [self.navigationController pushViewController:[TransactionViewController new] animated:YES];
                break;
            case 3:
                [self.navigationController pushViewController:[CABasiceAnimationViewController new] animated:YES];
                break;
            case 4:
                [self.navigationController pushViewController:[MediaTimingSystemViewController new] animated:YES];
                break;
            case 5:
                [self.navigationController pushViewController:[PauseAnimationViewController new] animated:YES];
                break;
            case 6:
                [self.navigationController pushViewController:[SpringAnimationViewController new] animated:YES];
                break;
            case 7:
                [self.navigationController pushViewController:[CAKeyframeAnimationViewController new] animated:YES];
                break;
            default:
                break;
        }
    }
}

@end
