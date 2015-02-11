//
//  UserInfo.m
//  DriftBottle
//
//  Created by admin on 15-2-9.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo()
@property int userId;
@property int logId;
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *realName;
@property (strong,nonatomic) NSString *address;
@property (strong,nonatomic) UIImage *headPicture;
@end

@implementation UserInfo
@synthesize userId = _userId,logId = _logId,userName = _userName,realName = _realName,address = _address,headPicture = _headPicture;

- (void)setUserId:(int)userId
{
    _userId = userId;
}
- (int)userId
{
    return _userId;
}
- (void)setLogId:(int)logId
{
    _logId = logId;
}
- (int)logId
{
    return _logId;
}
- (void)setUserName:(NSString *)userName
{
    _userName = userName;
}
- (NSString *)userName
{
    return _userName;
}
- (void)setRealName:(NSString *)realName
{
    _realName = realName;
}
- (NSString *)realName
{
    return _realName;
}
- (void)setAddress:(NSString *)address
{
    _address = address;
}
- (NSString *)address
{
    return _address;
}
- (void)setHeadPicture:(UIImage *)headPicture
{
    _headPicture = headPicture;
}
- (UIImage *)headPicture
{
    if(!_headPicture){
        _headPicture = [[UIImage alloc] init];
    }
    return _headPicture;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.userId = [aDecoder decodeIntForKey:@"userId"];
        self.logId = [aDecoder decodeIntForKey:@"logId"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.realName = [aDecoder decodeObjectForKey:@"realName"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.headPicture = [aDecoder decodeObjectForKey:@"headPicture"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.userId forKey:@"userId"];
    [aCoder encodeInt:self.logId forKey:@"logId"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.realName forKey:@"realName"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.headPicture forKey:@"headPicture"];
}
@end
