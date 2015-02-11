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
#import "UserInfo.h"

@interface MyBottleViewController ()
@property (strong, nonatomic)NSMutableArray *bottleArray;
@property (strong, nonatomic) IBOutlet UITableView *bottleTable;
@property (strong, nonatomic)BottleInfoViewController *bottleInfoViewController;
@property (strong, nonatomic)NSUserDefaultsDao *nsUserDefaultsDao;
@property double tableHeight;
@property NSString *status;;
@end

@implementation MyBottleViewController
@synthesize bottleArray = _bottleArray,bottleInfoViewController = _bottleInfoViewController,nsUserDefaultsDao = _nsUserDefaultsDao;

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self prepareForTable];
    //self.navigationItem.title = @"friends";
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"info" style:UIBarButtonItemStylePlain target:self action:@selector(toInfo)];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.status = @"Received";
    NSLog(@"this is bottle view");
}
- (void)viewWillAppear:(BOOL)animated
{
    //if([self.view viewWithTag:1000]){
    UIView *view = [self.view viewWithTag:1000];
    if(view){
    [view removeFromSuperview];
    NSLog(@"here");
    }
    [self prepareForTable];
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

- (IBAction)Received:(id)sender {
    if(![self.status isEqualToString:@"Received"]){
        UIView *view = [self.view viewWithTag:1000];
        if(view){
            [view removeFromSuperview];
            NSLog(@"here");
        }
        self.status = @"Received";
        [self prepareForTable];
    }
}

- (IBAction)posted:(id)sender {
    if(![self.status isEqualToString:@"Posted"]){
        UIView *view = [self.view viewWithTag:1000];
        if(view){
            [view removeFromSuperview];
            NSLog(@"here");
        }
        self.status = @"Posted";
        [self prepareForTable];
    }
}



//从storyBoard中获取某个UIViewController
- (id)getObject:(NSString *)objectId{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:objectId];
}

//跳转的准备工作
- (void)prepareForSegue:(NSInteger *)row
{
    _bottleInfoViewController = [self getObject:@"bottleInfoViewController"];
    NSLog(@"row is %ld",(long)row);
    [_bottleInfoViewController setBottle:[self.bottleArray objectAtIndex:row]];
    _bottleInfoViewController.index = row;
    _bottleInfoViewController.status = self.status;
    [self.navigationController pushViewController:_bottleInfoViewController animated:YES];
}



//这个方法返回该有几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.friendsList count];
    NSLog(@"count is %lu",(unsigned long)[self.bottleArray count]);
    return [self.bottleArray count];
}

//为UIViewController添加TableView
- (void)prepareForTable
{
    NSMutableArray *mutableBottleArray = [[NSMutableArray alloc] init];
    if([self.status isEqualToString:@"Received"]){
        mutableBottleArray = [self.nsUserDefaultsDao getObject:@"ReceivedBottleArray"];
    }else if([self.status isEqualToString:@"Posted"]){
        mutableBottleArray = [self.nsUserDefaultsDao getObject:@"PostedBottleArray"];
    }
    if(mutableBottleArray){
        self.bottleArray = [[NSMutableArray alloc] init];
        for (NSData *data in mutableBottleArray) {
            Bottle *bottle = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //NSLog(@"111");
            [self.bottleArray addObject:bottle];
        }
    
        self.tableHeight = [self.bottleArray count]*44;
    //self.friendsList = list;
    //NSLog(@"height is :%f,width is :%f",self.view.frame.size.height,self.view.frame.size.width);
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 122, 320, self.tableHeight) style:UITableViewStylePlain];
        [tableView setBackgroundColor:[UIColor grayColor]];
        self.bottleTable = tableView;
        self.bottleTable.dataSource = self;
        self.bottleTable.delegate = self;
        self.bottleTable.tag = 1000;
        [self.view addSubview:self.bottleTable];
    }
    
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
    
    UserInfo *user = [[UserInfo alloc] init];
    if(bottle.throwerId == 1){
        user = [NSKeyedUnarchiver unarchiveObjectWithData:[self.nsUserDefaultsDao getObject:@"Tom"]];
    }else if(bottle.throwerId == 2){
        user = [NSKeyedUnarchiver unarchiveObjectWithData:[self.nsUserDefaultsDao getObject:@"Mike"]];
//        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"This bottle was from:",user.userName];
//        cell.imageView.image = user.headPicture;
//        cell.textLabel.text = [NSString stringWithFormat:@"%@",@"This bottle was from:Mike"];
    }else if(bottle.throwerId == 3){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",@"This bottle was from:self"];
    }
    if (user) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"This bottle was from:",user.userName];
        cell.imageView.image = user.headPicture;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"headPicture1"];
    }
    
    //CGRect cellFrame = [cell frame];
    //cellFrame.origin = CGPointMake(0, 0);
   
    //cellFrame.size.height = cellFrame.size.height + 40;
    //[cell setFrame:cellFrame];
    //NSLog(@"cell height:%f,and width:%f",cellFrame.size.height,cellFrame.size.width);
    return cell;
}

//当点击某个cell时调用
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
   // NSLog(@"row is %lu,index is %@",(unsigned long)row,indexPath);
    
    [self prepareForSegue:row];
   // NSLog(@"this is a click%ld",(long)row);
    return indexPath;
}

//滑动之后可以进行删除删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if([self.status isEqualToString:@"Received"]){
        NSMutableArray *mutableBottleArray = [self.nsUserDefaultsDao getObject:@"ReceivedBottleArray"];
        [mutableBottleArray removeObjectAtIndex:row];
        [self.nsUserDefaultsDao addObject:mutableBottleArray forKey:@"ReceivedBottleArray"];
    }else if([self.status isEqualToString:@"Posted"]){
        NSMutableArray *mutableBottleArray = [self.nsUserDefaultsDao getObject:@"PostedBottleArray"];
        [mutableBottleArray removeObjectAtIndex:row];
        [self.nsUserDefaultsDao addObject:mutableBottleArray forKey:@"PostedBottleArray"];
    }
    
    UIView *view = [self.view viewWithTag:1000];
    if(view){
        [view removeFromSuperview];
        NSLog(@"here");
    }
    [self prepareForTable];
}
@end
