# DZHandy
基于运行时的一些分类

```Objective-C
@interface DZSecondViewController ()
@end

@implementation DZSecondViewController
//点击按钮数据传递
- (void)buttonClink {
    
    [self dzSendObject:self.messageField.text withIdentifier:identifier];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
```

```Objective-C
@interface ViewController ()
@end

@implementation ViewController
//按钮事件回调,点击按钮跳转界面
    UIButton *button = [self buttonWithTitle:@"点击跳转" topMargin:150];
    
    [button dzHandleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        
        DZSecondViewController *second = [[DZSecondViewController alloc] init];
        
        [self.navigationController pushViewController:second animated:YES];
        
        //接受 DZSecondViewController 发送的数据
        
        [second dzReceiveObject:^(id  _Nullable object) {
            
            [self.receiveButton setTitle:(NSString *)object  forState:UIControlStateNormal];
            
            [self.receiveButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            
            
        } withIdentifier:identifier];
        
    }];

@end
```

```Objective-C
@implementation DZPerson
//解档和归档一句代码搞定
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
```

```
//打印下划线的成员变量
[UITableView dzPrintIvars];
```

发现问题欢迎反馈


