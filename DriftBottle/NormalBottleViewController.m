//
//  NormalBottleViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-25.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "NormalBottleViewController.h"

@interface NormalBottleViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NormalBottleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.textView setBackgroundColor:[UIColor yellowColor]];
    [self.textView setTextColor:[UIColor redColor]];
    
}
- (IBAction)send:(id)sender {
    
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
