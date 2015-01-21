//
//  Message.m
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Message.h"

@interface Message()
@property (strong,atomic)NSString *sender;
@property (strong,atomic)NSString *content;

@end

@implementation Message
@synthesize sender = _sender,content = _content;
- (void)setSender:(NSString *)sender
{
    _sender = sender;
}
- (NSString *)sender
{
    return _sender;
}

- (void)setContent:(NSString *)content
{
    _content = content;
}
- (NSString *)content
{
    return _content;
}

@end
