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

@interface NormalBottleViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic)Bottle *bottle;
@property (strong, nonatomic)Message *message;

@end

@implementation NormalBottleViewController
@synthesize bottle = _bottle,message = _message;

- (void)setBottle:(Bottle *)bottle
{
    _bottle = bottle;
}
- (Bottle *)bottle
{
    if(!_bottle){
        _bottle = [[Bottle alloc] init];
    }
    return _bottle;
}

- (void)setMessage:(Message *)message
{
    _message = message;
}
- (Message *)message
{
    if(!_message){
        _message = [[Message alloc] init];
    }
    return _message;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.textView setBackgroundColor:[UIColor yellowColor]];
    [self.textView setTextColor:[UIColor redColor]];
    
}
- (IBAction)send:(id)sender {
    [self.message setSender:@"self"];
    NSString *content = self.textView.text;
    [self.message setContent:content];
    [self.bottle setThrower:@"self"];
    [self.bottle addMessage:self.message];
    NSMutableArray *messageArray = [[NSMutableArray alloc] init];
    messageArray = [self.bottle getMessage];
    for(Message *mess in messageArray)
    {
        NSLog(@"%@",mess.content);
    }
    
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
