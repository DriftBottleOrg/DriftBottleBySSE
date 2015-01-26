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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.sender = [aDecoder decodeObjectForKey:@"sender"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.sender forKey:@"sender"];
    [aCoder encodeObject:self.content forKey:@"content"];
}

@end
