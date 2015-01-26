//
//  MyBottleViewController.m
//  DriftBottle
//
//  Created by admin on 14-12-15.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "MyBottleViewController.h"
#import "EditSelfViewController.h"
#import "Bottle.h"
#import "BottleInfoViewController.h"
#import "NSUserDefaultsDao.h"

@interface MyBottleViewController ()
@property (strong, nonatomic)NSMutableArray *bottleArray;
@property (strong, nonatomic) NSMutableArray *friendsList;
@property (strong, nonatomic) IBOutlet UITableView *friendsTable;
@property (strong, nonatomic)BottleInfoViewController *bottleInfoViewController;
@property (strong, nonatomic)NSUserDefaultsDao *nsUserDefaultsDao;
@property double tableHeight;
@end

@implementation MyBottleViewController
@synthesize bottleArray = _bottleArray,bottleInfoViewController = _bottleInfoViewController,nsUserDefaultsDao = _nsUserDefaultsDao;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForTable];
    //self.navigationItem.title = @"friends";
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"info" style:UIBarButtonItemStylePlain target:self action:@selector(toInfo)];
   // self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)setBottleArray:(NSMutableArray *)bottleArray
{
    _bottleArray = bottleArray;
}
- (NSMutableArray *)bottleArray
{
    if(!_bottleArray)
    {
        _bottleArray = [[NSMutableArray alloc] init];
    }
    return _bottleArray;
}

- (NSUserDefaultsDao *)nsUserDefaultsDao
{
    if(!_nsUserDefaultsDao){
        _nsUserDefaultsDao = [[NSUserDefaultsDao alloc] init];
    }
    return _nsUserDefaultsDao;
}

//从storyBoard中获取某个UIViewController
- (id)getObject:(NSString *)objectId{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:objectId];
}

//跳转的准备工作
- (void)prepareForSegue:(NSInteger *)row
{
    //if(!_bottleInfoViewController){
        _bottleInfoViewController = [self getObject:@"bottleInfoViewController"];
    //}
    NSLog(@"row is %ld",(long)row);
    [_bottleInfoViewController setBottle:[self.bottleArray objectAtIndex:row]];
    [self.navigationController pushViewController:_bottleInfoViewController animated:YES];
}


//这个方法返回该有几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.friendsList count];
    return [self.bottleArray count];
}

//为UIViewController添加TableView
- (void)prepareForTable
{
   // NSMutableArray *list = [NSMutableArray arrayWithObjects:@"Tom",@"Mike",@"Lucy",@"Sheldon",@"Leonard",@"Raj",@"Amy",@"Java",@"C",@"C++",@"C#",@"J2EE",@"JSP",@"Objective-C", nil];
    
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
    
    [self.bottleArray addObject:bottle1];
    [self.bottleArray addObject:bottle2];
    
    //[self.nsUserDefaultsDao addObject:self.bottleArray forKey:@"bottleArray"];
    
    self.tableHeight = [self.bottleArray count]*44;
    //self.friendsList = list;
    NSLog(@"height is :%f,width is :%f",self.view.frame.size.height,self.view.frame.size.width);
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.tableHeight) style:UITableViewStylePlain];
   // UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 122, 320, 397) style:UITableViewStylePlain];
    //UITableView *tab = [[UITableView alloc] init];
    [tableView setBackgroundColor:[UIColor grayColor]];
    self.friendsTable = tableView;
    self.friendsTable.dataSource = self;
    self.friendsTable.delegate = self;
    [self.view addSubview:self.friendsTable];
    
    
}

//自动调用，设置cell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    //cell.textLabel.text = [self.friendsList objectAtIndex:row];
    Bottle *bottle = [[Bottle alloc] init];
    bottle = [self.bottleArray objectAtIndex:row];
//    NSString *string = [NSString initW]
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"This bottle was from:",bottle.thrower];
    cell.imageView.image = [UIImage imageNamed:@"headPicture"];
    CGRect cellFrame = [cell frame];
    //cellFrame.origin = CGPointMake(0, 0);
   
    //cellFrame.size.height = cellFrame.size.height + 40;
    //[cell setFrame:cellFrame];
    NSLog(@"cell height:%f,and width:%f",cellFrame.size.height,cellFrame.size.width);
    return cell;
}

//当点击某个cell时调用
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSLog(@"row is %lu,index is %@",(unsigned long)row,indexPath);
    
    [self prepareForSegue:row];
    NSLog(@"this is a click%ld",(long)row);
    return indexPath;
}
@end
