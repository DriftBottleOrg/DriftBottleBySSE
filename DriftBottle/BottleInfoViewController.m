//
//  BottleInfoViewController.m
//  DriftBottle
//
//  Created by admin on 15-1-21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "BottleInfoViewController.h"
#import "Bottle.h"
#import "Message.h"
#import "NSUserDefaultsDao.h"

@interface BottleInfoViewController ()
@property (strong, nonatomic) Bottle *bottle;
@property (strong, nonatomic) IBOutlet UITableView *messageTable;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSUserDefaultsDao *nsUserDefaultsDao;
@end

@implementation BottleInfoViewController
@synthesize bottle = _bottle,index;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForTable];
    NSLog(@"bottle info view controller");
    [self setTitle:@"info"];
}


- (void)setBottle:(Bottle *)bottle
{
    _bottle = bottle;
}
- (Bottle *)bottle
{
    if(!_bottle){
        return nil;
    }
    return _bottle;
}
- (NSUserDefaultsDao *)nsUserDefaultsDao
{
    if(!_nsUserDefaultsDao){
        _nsUserDefaultsDao = [[NSUserDefaultsDao alloc] init];
    }
    return _nsUserDefaultsDao;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.bottle messageArray] count];
    //NSInteger i = 3;
    //return i;
}


- (void)prepareForTable
{
    NSMutableArray *messageArray = [self.bottle messageArray];
    double height = [messageArray count]*44;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 164, 320, height) style:UITableViewStylePlain];
    //tableView.dataSource = self;
    //tableView.delegate = self;
    [tableView setBackgroundColor:[UIColor grayColor]];
    self.messageTable = tableView;
    self.messageTable.dataSource = self;
    self.messageTable.delegate = self;
    self.messageTable.tag = 2000;
    [self.view addSubview:self.messageTable];
    
    
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

- (IBAction)reply:(id)sender {
    Message *message = [[Message alloc] init];
    message.sender = @"self";
    message.content = self.textView.text;
    [self.bottle.messageArray addObject:message];
    NSData *bottleData = [NSKeyedArchiver archivedDataWithRootObject:self.bottle];
    
    NSMutableArray *mutableBottleArray = [self.nsUserDefaultsDao getObject:@"bottleArray"];
    [mutableBottleArray replaceObjectAtIndex:self.index withObject:bottleData];
    [self.nsUserDefaultsDao addObject:mutableBottleArray forKey:@"bottleArray"];
    
    UIView *view = [self.view viewWithTag:2000];
    [view removeFromSuperview];
    self.textView.text = nil;
    [self prepareForTable];
    //[self.friendsTable reloadData];
    //[mutableBottleArray removeObjectAtIndex:self.index];
    //[mutableBottleArray addObjec]
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
