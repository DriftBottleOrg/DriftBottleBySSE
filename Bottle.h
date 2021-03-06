//
//  Bottle.h
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

@interface Bottle : NSObject <NSCoding>

- (void)setThrowerId:(int)throwerId;
- (int)throwerId;

- (void)setMessageArray:(NSMutableArray *)messageArray;
- (NSMutableArray *)messageArray;


- (void)addMessage:(Message *)message;
- (NSMutableArray *)getMessage;


@end
