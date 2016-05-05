//
//  NSObject+DZCode.m
//  NSObjectRunTime
//
//  Created by 董棁 on 16/4/26.
//  Copyright © 2016年 董棁. All rights reserved.
//


#import "NSObject+DZObject.h"
#import <objc/runtime.h>

@implementation NSObject (DZObject)

/**
 归档
 */
- (void)dzCoderWithCoder:( NSCoder * _Nullable )aCoder Class:(nullable Class)Class{
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(Class, &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar);
        
        NSString *key = [[NSString alloc] initWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

/**
 解档
 */
- (void)dzDecoderWithCoder:( NSCoder * _Nullable )aDecoder Class:(nullable Class)Class{
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(Class, &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar);
        
        NSString *key = [[NSString alloc] initWithUTF8String:name];
        
        id value = [aDecoder decodeObjectForKey:key];
        
        [self setValue:value forKey:key];
    }
    free(ivars);
}


//****************************
const char DZObjectSingleObjectDictionary;

- (void)dzReceiveObject:(void (^)(id _Nullable))sendObject{
    
    [self dzReceiveObject:sendObject withIdentifier:@"DZObjectSingleObjectDictionary"];
}

- (void)dzSendObject:(id)object{
    
    [self dzSendObject:object withIdentifier:@"DZObjectSingleObjectDictionary"];
}


- (void)dzReceiveObject:(void (^)(id _Nullable))sendObject withIdentifier:(NSString *)identifier{
    
    NSAssert(identifier != nil, @"identifier can't be nil.");
    
    NSMutableDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&DZObjectSingleObjectDictionary);
    
    if(eventHandlerDictionary == nil)
    {
        eventHandlerDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &DZObjectSingleObjectDictionary, eventHandlerDictionary, OBJC_ASSOCIATION_RETAIN);
    }
    
    [eventHandlerDictionary setObject:sendObject forKey:identifier];
}

- (void)dzSendObject:(id)object withIdentifier:(NSString *)identifier{
    
    NSAssert(identifier != nil, @"identifier can't be nil.");
    
    NSDictionary *eventHandlerDictionary = objc_getAssociatedObject(self,&DZObjectSingleObjectDictionary);
    
    if(eventHandlerDictionary == nil)
        return;
    
    void(^block)(id object) =  [eventHandlerDictionary objectForKey:identifier];
    
    block(object);
}

//****************************

const char DZObjectStoreKey;
-(void)setDZObject:(id)obj
{
    objc_setAssociatedObject(self, &DZObjectStoreKey, obj, OBJC_ASSOCIATION_RETAIN);
}
-(id)getDZObject
{
    return objc_getAssociatedObject(self, &DZObjectStoreKey);
}



@end
