//
//  ViewController.m
//  Demo
//
//  Created by 董棁 on 16/4/27.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import "ViewController.h"
#import "DZHandy.h"
#import "DZPerson.h"
#import "DZSecondViewController.h"

#define path [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"test.data"]

#define identifier @"message"

@interface ViewController ()

@property (nonatomic, strong) DZPerson *person;

@property (nonatomic, weak) UIButton *receiveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dzControlExample];
    
    [self dzCodeExample];
    
    
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
    
}


- (void) dzCodeExample {
    
    self.person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"姓名: %@,年龄: %zd",self.person.name,self.person.age);
}


- (void) dzControlExample {
    
    UIButton *button = [self buttonWithTitle:@"点击按钮归档" topMargin:100];

    [button dzHandleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        
        self.person.name = @"小明";
        self.person.age = 20;
        
        [NSKeyedArchiver archiveRootObject:self.person toFile:path];
        
        NSLog(@"点击按钮回调,归档成功");
    }];
}


- (UIButton *)buttonWithTitle:(NSString *)text topMargin:(CGFloat)topMargin{
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:text forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:topMargin];
    [self.view addConstraints:@[centerX,top]];
    
    return button;
}



- (DZPerson *)person{
    
    if (_person == nil) {
        
        _person = [[DZPerson alloc] init];
    }
    return _person;
}

- (UIButton *)receiveButton{
    
    if (_receiveButton == nil) {
        
        _receiveButton = [self buttonWithTitle:nil topMargin:250];
    }
    return _receiveButton;
}



@end
