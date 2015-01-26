//
//  TabBarViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "TabBarViewController.h"
#import "Reachability.h"
#import "Bottle.h"
#import "Message.h"
#import "NSUserDefaultsDao.h"

@interface TabBarViewController ()
@property (strong, nonatomic)NSUserDefaultsDao *nsUserDefaultsDao;
@end

@implementation TabBarViewController
@synthesize nsUserDefaultsDao = _nsUserDefaultsDao;
- (NSUserDefaultsDao *)nsUserDefaultsDao
{
    if(!_nsUserDefaultsDao){
        _nsUserDefaultsDao = [[NSUserDefaultsDao alloc] init];
    }
    return _nsUserDefaultsDao;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [self saveBottle];
}

//一开始的时候手动载入两个漂流瓶
- (void)saveBottle
{
    Bottle *bottle1 = [[Bottle alloc] init];
    Message *message11 = [[Message alloc] init];
    message11.sender = @"message11";
    message11.content = @"content11";
    [bottle1.messageArray addObject:message11];
    [bottle1 setThrower:@"Tom"];
    
    Bottle *bottle2 = [[Bottle alloc] init];
    Message *message21 = [[Message alloc] init];
    message21.sender = @"message21";
    message21.content = @"content21";
    Message *message22 = [[Message alloc] init];
    message22.sender = @"message22";
    message22.content = @"content22";
    [bottle2 setThrower:@"Mike"];
    [bottle2.messageArray addObject:message21];
    [bottle2.messageArray addObject:message22];
    

    NSData *bottle1Data = [NSKeyedArchiver archivedDataWithRootObject:bottle1];
    NSData *bottle2Data = [NSKeyedArchiver archivedDataWithRootObject:bottle2];

    
    NSArray *bottleArrayUnMutable = [NSArray arrayWithObjects:bottle1Data,bottle2Data, nil];
    
    [self.nsUserDefaultsDao addObject:bottleArrayUnMutable forKey:@"bottleArray"];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"TabBarViewController viewWillAppear");
}


@end
