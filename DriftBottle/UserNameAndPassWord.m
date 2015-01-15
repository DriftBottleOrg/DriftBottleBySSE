//
//  UserNameAndPassWord.m
//  DriftBottle
//
//  Created by admin on 14-12-17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "UserNameAndPassWord.h"



@implementation UserNameAndPassWord
//@synthesize userName,passWord;

{
    NSString *userName;
    NSString *passWord;
}
- (void)setUserName:(NSString *)_userName
{
    userName = _userName;
}
- (NSString *)userName
{
    return userName;
}

- (void)setPassWord:(NSString *)_passWord
{
    passWord=_passWord;
}
- (NSString *)passWord
{
    return passWord;
}

@end
