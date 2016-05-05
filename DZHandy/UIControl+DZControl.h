//
//  UIControl+DZControl.h
//  test
//
//  Created by 董棁 on 16/4/27.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (DZControl)


// 事件触发回调
- (void)dzHandleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;

- (void)dzRemoveHandlerForEvent:(UIControlEvents)event;

@end
