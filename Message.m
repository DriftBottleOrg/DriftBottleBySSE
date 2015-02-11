//
//  Message.m
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Message.h"

@interface Message()
@property int senderId;
@property (strong,atomic)NSString *content;

@end

@implementation Message
@synthesize senderId = _senderId,content = _content;

- (void)setSenderId:(int)senderId
{
    _senderId = senderId;
}
- (int)senderId
{
    return _senderId;
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
        self.senderId = [aDecoder decodeIntForKey:@"senderId"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.senderId forKey:@"senderId"];
    [aCoder encodeObject:self.content forKey:@"content"];
}

@end
