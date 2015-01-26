//
//  NormalBottleViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-25.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "NormalBottleViewController.h"
#import "Bottle.h"
#import "Message.h"
#import "NSUserDefaultsDao.h"

@interface NormalBottleViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSUserDefaultsDao *nsUserDefaultsDao;
@end

@implementation NormalBottleViewController

- (NSUserDefaultsDao *)nsUserDefaultsDao
{
    if(!_nsUserDefaultsDao){
        _nsUserDefaultsDao = [[NSUserDefaultsDao alloc] init];
    }
    return _nsUserDefaultsDao;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.textView setBackgroundColor:[UIColor yellowColor]];
    [self.textView setTextColor:[UIColor redColor]];
    
}
- (IBAction)send:(id)sender {
    Message *message = [[Message alloc] init];
    message.sender = @"self";
    message.content = self.textView.text;
    
    Bottle *bottle = [[Bottle alloc] init];
    bottle.thrower = @"mySelf";
    [bottle.messageArray addObject:message];
    
    NSData *bottleData = [NSKeyedArchiver archivedDataWithRootObject:bottle];
    
    NSMutableArray *mutableBottleArray = [self.nsUserDefaultsDao getObject:@"bottleArray"];
    [mutableBottleArray addObject:bottleData];
    //[mutableBottleArray replaceObjectAtIndex:self.index withObject:bottleData];
    [self.nsUserDefaultsDao addObject:mutableBottleArray forKey:@"bottleArray"];

    
    
}




@end
