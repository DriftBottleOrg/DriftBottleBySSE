//
//  TabBarViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "TabBarViewController.h"
#import "Reachability.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TabBarViewController");
    
    //判断网络类型，wifi/3G4G
    Reachability *netReach = [Reachability reachabilityForLocalWiFi];
    switch ([netReach currentReachabilityStatus]) {
        case NotReachable:
            NSLog(@"can't reach net");
            break;
        case ReachableViaWiFi:
            NSLog(@"net type:wifi");
            break;
        case ReachableViaWWAN:
            NSLog(@"net type:3G/4G");
            break;
        default:
            break;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"TabBarViewController viewWillAppear");
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
