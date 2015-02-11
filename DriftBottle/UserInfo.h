//
//  UserInfo.h
//  DriftBottle
//
//  Created by admin on 15-2-9.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfo : NSObject <NSCoding>
- (void)setUserId:(int)userId;
- (int)userId;
- (void)setLogId:(int)logId;
- (int)logId;
- (void)setUserName:(NSString *)userName;
- (NSString *)userName;
- (void)setRealName:(NSString *)realName;
- (NSString *)realName;
- (void)setAddress:(NSString *)address;
- (NSString *)address;
- (void)setHeadPicture:(UIImage *)headPicture;
- (UIImage *)headPicture;
@end