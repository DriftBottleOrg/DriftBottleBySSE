//
//  Bottle.m
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Bottle.h"

@interface Bottle()

@property int throwerId;
@property (strong,nonatomic)NSMutableArray *messageArray;

@end

@implementation Bottle
@synthesize throwerId = _throwerId,messageArray = _messageArray;

//- (instancetype)init
//{
//    self = [super init];
//    if(self){
//        
//    }
//    return self;
//}

- (void)setThrowerId:(int)throwerId
{
    _throwerId = throwerId;
}
- (int)throwerId
{
    return _throwerId;
}


- (void)setMessageArray:(NSMutableArray *)messageArray
{
    _messageArray = messageArray;
    
}
- (NSMutableArray *)messageArray
{
    if(!_messageArray){
        _messageArray = [[NSMutableArray alloc] init];
    }
    return _messageArray;
}



- (void)addMessage:(Message *)message
{
    [self.messageArray addObject:message];
}
- (NSMutableArray *)getMessage
{
    return self.messageArray;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.throwerId = [aDecoder decodeIntForKey:@"throwerId"];
        self.messageArray = [aDecoder decodeObjectForKey:@"messageArray"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.throwerId forKey:@"throwerId"];
    [aCoder encodeObject:self.messageArray forKey:@"messageArray"];
}

@end
