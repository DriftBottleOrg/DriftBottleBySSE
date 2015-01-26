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


- (IBAction)fish:(id)sender {
    int chance = arc4random()%6 + 1;
    NSLog(@"%i",chance);
    
    if([self.view viewWithTag:10000]){
        UIView *subView = [self.view viewWithTag:10000];
        [subView removeFromSuperview];
    }
    if(chance < 4){
        [self fishBottle:@"fishFailGif"];
    }else{
        [self fishBottle:@"fishSucceedGif"];
    }
}

- (void)fishBottle:(NSString *)status
{
    CGRect frame = CGRectMake(0, 0, 0, 0);
    frame.size = [UIImage imageNamed:status].size;
    NSLog(@"height is %f,width is %f",frame.size.height,frame.size.width);
    NSData *gif = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:status ofType:@"gif"]];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;
    webView.tag = 10000;
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    //[webView release];
                
}



@end
