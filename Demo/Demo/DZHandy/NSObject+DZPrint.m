//
//  NSObject+DZPrint.m
//  NSObjectRunTime
//
//  Created by 董棁 on 16/4/26.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import "NSObject+DZPrint.h"
#import <objc/runtime.h>

@implementation NSObject (DZPrint)

/**
 _成员变量
 */
+ (void) dzPrintIvars{
    
    unsigned int outCount = 0;
    
    Ivar *ivars = class_copyIvarList(self, &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        
        Ivar ivar = ivars[(int)i];
        
        const char *cName = ivar_getName(ivar);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        NSLog(@"ivar: %@",name);
    }
    free(ivars);
}


/**
 方法
 */
+ (void) dzPrintMethods{
    
    unsigned int outCount = 0;
    
    Method *methods = class_copyMethodList(self, &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        
        Method method = methods[(int)i];
        
        method_getName(method);
        
        NSLog(@"method: %@",NSStringFromSelector(method_getName(method)));
    }
    free(methods);
}


/**
 属性
 */
+ (void) dzPrintPropertys{
    
    unsigned int outCount = 0;
    
    objc_property_t *propertys = class_copyPropertyList(self, &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        
        objc_property_t property = propertys[i];
        
        const char *cName = property_getName(property);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        NSLog(@"property: %@",name);
    }
    free(propertys);
}


/**
 协议
 */
+ (void) dzPrintProtocols{
    
    unsigned int outCount = 0;
    
    Protocol * __unsafe_unretained *protocols = class_copyProtocolList(self, &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        
        Protocol * __unsafe_unretained  protocol = protocols[i];
        
        const char *cName = protocol_getName(protocol);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        NSLog(@"protocol: %@",name);
    }
    free(protocols);
}


@end
