//
//  DZSecondViewController.m
//  Demo
//
//  Created by 董棁 on 16/4/27.
//  Copyright © 2016年 董棁. All rights reserved.
//

#import "DZSecondViewController.h"
#import "DZHandy.h"
#define identifier @"message"

@interface DZSecondViewController ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UITextField *messageField;


@end

@implementation DZSecondViewController


//点击按钮数据传递
- (void)buttonClink {
    
    [self dzSendObject:self.messageField.text withIdentifier:identifier];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self setupLayout];
        
    }
    return self;
}

- (void)setupLayout{
    
    [self.view addSubview:self.messageField];
    [self.view addSubview:self.button];
    
    self.messageField.translatesAutoresizingMaskIntoConstraints = NO;
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *messageCenterX = [NSLayoutConstraint constraintWithItem:self.messageField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *messageCenterY = [NSLayoutConstraint constraintWithItem:self.messageField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *messageRight = [NSLayoutConstraint constraintWithItem:self.messageField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    NSLayoutConstraint *messageLeft = [NSLayoutConstraint constraintWithItem:self.messageField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:-20];
    [self.view addConstraints:@[messageCenterX,messageCenterY,messageRight,messageLeft]];
    
    NSLayoutConstraint *buttonCenterX = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *buttonTop = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.messageField attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    [self.view addConstraints:@[buttonCenterX,buttonTop]];
    
}

- (UIButton *)button{
    
    if (_button == nil) {
        
        _button = [[UIButton alloc] init];
        
        [_button setTitle:@"点击发送消息" forState:UIControlStateNormal];
        
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(buttonClink) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}

- (UITextField *)messageField{
    
    if (_messageField == nil) {
        
        _messageField = [[UITextField alloc] init];
        
        _messageField.placeholder = @"输入要回调的信息";
        
        _messageField.textAlignment = NSTextAlignmentCenter;
    }
    return _messageField;
}

@end
