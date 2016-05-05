//
//  NSObject+DZPrint.h
//  NSObjectRunTime
//
//  Created by 董棁 on 16/4/26.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DZPrint)

/**
 _成员变量
 */
+ (void) dzPrintIvars;

/**
 方法
 */
+ (void) dzPrintMethods;

/**
 属性
 */
+ (void) dzPrintPropertys;

/**
 协议
 */
+ (void) dzPrintProtocols;

@end
