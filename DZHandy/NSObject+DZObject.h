//
//  NSObject+DZCode.h
//  NSObjectRunTime
//
//  Created by 董棁 on 16/4/26.
//  Copyright © 2016年 董棁. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (DZObject)

// 归档
- (void)dzCoderWithCoder:( NSCoder * _Nullable )aCoder Class:(nullable Class)Class;
// 解档
- (void)dzDecoderWithCoder:( NSCoder * _Nullable )aDecoder Class:(nullable Class)Class;


//接收对象,默认的 identifier 是 @"DZObjectSingleObjectDictionary"
-(void)dzReceiveObject:(void(^ _Nullable)(_Nullable id object))sendObject;
//发送对象,有默认的 identidfier
-(void)dzSendObject:(_Nullable id)object;

//接收对象, identifider 不能为空
-(void)dzReceiveObject:(void( ^ _Nullable)(_Nullable id object))sendObject withIdentifier:(NSString * _Nullable)identifier;
//发送对象, identifider 不能为空
-(void)dzSendObject:(_Nullable id)object withIdentifier:(NSString * _Nullable)identifier;


//添加属性
-(void)setDZObject:(_Nullable id)obj;
-(_Nullable id)getDZObject;


@end
