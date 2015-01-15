//
//  FishViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-15.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "FishViewController.h"

@interface FishViewController ()

@end

@implementation FishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 50, 60, 30)];
    [self.view addSubview:button];
    NSLog(@"FishViewController");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
