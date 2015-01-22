//
//  BottleInfoViewController.m
//  DriftBottle
//
//  Created by admin on 15-1-21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "BottleInfoViewController.h"
#import "Bottle.h"

@interface BottleInfoViewController ()
@property (strong, nonatomic)Bottle *bottle;
@property (strong, nonatomic) IBOutlet UITableView *friendsTable;
@end

@implementation BottleInfoViewController
@synthesize bottle = _bottle;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForTable];
}

- (void)setBottle:(Bottle *)bottle
{
    _bottle = bottle;
}
- (Bottle *)bottle
{
    if(!_bottle){
        NSLog(@"wrong");
        return nil;
    }
    return _bottle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.bottle messageArray] count];
    //NSInteger i = 3;
    //return i;
}


- (void)prepareForTable
{

    NSMutableArray *message = [self.bottle messageArray];
    double height = [message count]*44;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 164, 320, height) style:UITableViewStylePlain];
    //tableView.dataSource = self;
    //tableView.delegate = self;
    [tableView setBackgroundColor:[UIColor grayColor]];
    self.friendsTable = tableView;
    self.friendsTable.dataSource = self;
    self.friendsTable.delegate = self;
    [self.view addSubview:self.friendsTable];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    Message *message = [[self.bottle messageArray] objectAtIndex:row];
    cell.textLabel.text = message.sender;
    cell.imageView.image = [UIImage imageNamed:@"headPicture"];
    cell.detailTextLabel.text = message.content;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSLog(@"row is %lu,index is %@",(unsigned long)row,indexPath);
    return indexPath;
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//    NSArray *subViews = [self.view subviews];
//    for(UIView *view in subViews){
//        [view removeFromSuperview];
//    }
//}
@end
