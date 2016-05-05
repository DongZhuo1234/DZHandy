//
//  DZPerson.m
//  Demo
//
//  Created by 董棁 on 16/4/27.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import "DZHandy.h"
#import "DZPerson.h"


@implementation DZPerson


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        //解档
        [self dzDecoderWithCoder:aDecoder Class:[self class]];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    //归档
    [self dzCoderWithCoder:aCoder Class:[self class]];
}

@end
