//
//  Message.h
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject <NSCoding>

- (void)setSenderId:(int)senderId;
- (int)senderId;
- (void)setContent:(NSString *)content;
- (NSString *)content;

@end
