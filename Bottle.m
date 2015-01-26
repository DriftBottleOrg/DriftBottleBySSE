//
//  Bottle.m
//  DriftBottle
//
//  Created by admin on 15-1-10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Bottle.h"

@interface Bottle()

@property (strong,nonatomic)NSString *thrower;
@property (strong,nonatomic)NSMutableArray *messageArray;

@end

@implementation Bottle
@synthesize thrower = _thrower,messageArray = _messageArray;

//- (instancetype)init
//{
//    self = [super init];
//    if(self){
//        
//    }
//    return self;
//}


- (void)setThrower:(NSString *)thrower
{
    _thrower = thrower;
}
- (NSString *)thrower
{
    return _thrower;
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
        self.thrower = [aDecoder decodeObjectForKey:@"thrower"];
        self.messageArray = [aDecoder decodeObjectForKey:@"messageArray"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.thrower forKey:@"thrower"];
    [aCoder encodeObject:self.messageArray forKey:@"messageArray"];
}

@end
