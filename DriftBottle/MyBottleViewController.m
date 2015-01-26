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
@property (strong, nonatomic) IBOutlet UITableView *bottleTable;
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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:nil action:@selector(backFromBottleInfoViewController)];
    NSLog(@"this is bottle view");
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Bottle view will apear");
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
    _bottleInfoViewController.index = row;
    [self.navigationController pushViewController:_bottleInfoViewController animated:YES];
}

- (void)backFromBottleInfoViewController{
    UIView *view = [self.view viewWithTag:1000];
    [view removeFromSuperview];
    [self prepareForTable];
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
   
//    Bottle *bottle1 = [[Bottle alloc] init];
//    Message *message11 = [[Message alloc] init];
//    message11.sender = @"message11";
//    message11.content = @"content11";
//    [bottle1.messageArray addObject:message11];
//    [bottle1 setThrower:@"Tom"];
//    
//    Bottle *bottle2 = [[Bottle alloc] init];
//    Message *message21 = [[Message alloc] init];
//    message21.sender = @"message21";
//    message21.content = @"content21";
//    Message *message22 = [[Message alloc] init];
//    message22.sender = @"message22";
//    message22.content = @"content22";
//    [bottle2 setThrower:@"Mike"];
//    [bottle2.messageArray addObject:message21];
//    [bottle2.messageArray addObject:message22];
//    
//   
//    NSData *bottle1Data = [NSKeyedArchiver archivedDataWithRootObject:bottle1];
//    NSData *bottle2Data = [NSKeyedArchiver archivedDataWithRootObject:bottle2];
//   
//    [self.bottleArray addObject:bottle1];
//    [self.bottleArray addObject:bottle2];
//    NSArray *bottleArrayUnMutable = [NSArray arrayWithObjects:bottle1Data,bottle2Data, nil];
//   
//    [self.nsUserDefaultsDao addObject:bottleArrayUnMutable forKey:@"bottleArray"];

    
    NSMutableArray *mutableBottleArray = [self.nsUserDefaultsDao getObject:@"bottleArray"];
    for (NSData *data in mutableBottleArray) {
        Bottle *bottle = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"111");
        [self.bottleArray addObject:bottle];
    }
    
    self.tableHeight = [self.bottleArray count]*44;
    //self.friendsList = list;
    NSLog(@"height is :%f,width is :%f",self.view.frame.size.height,self.view.frame.size.width);
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.tableHeight) style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor grayColor]];
    self.bottleTable = tableView;
    self.bottleTable.dataSource = self;
    self.bottleTable.delegate = self;
    self.bottleTable.tag = 1000;
    [self.view addSubview:self.bottleTable];
    
    
}

//存储到NSUserDefaults
- (void)saveForNSUserDefaults:(id)object
{
    
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
