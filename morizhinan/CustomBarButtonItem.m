//
//  CustomBarButtonItem.m
//  WhoHelp
//
//  Created by Dai Cloud on 12-1-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomBarButtonItem.h"

@implementation CustomBarButtonItem

-(id)initBackBarButtonItemWithTarget:(id)target action:(SEL)action
{
    self = [super init];
    if (self != nil){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 51, 29);
        button.backgroundColor = [UIColor clearColor];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_back_down.png"] forState:UIControlStateHighlighted];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        self.customView = button;
    }
    
    return self;
}
//
//-(id)initSendBarButtonItemWithTarget:(id)target action:(SEL)action
//{
//    self = [super init];
//    if (self != nil){
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, 30, 20);
//        button.backgroundColor = [UIColor clearColor];
//        [button setBackgroundImage:[UIImage imageNamed:@"sendup.png"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"senddown.png"] forState:UIControlStateHighlighted];
//        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        
//        self.customView = button;
//    }
//    
//    return self; 
//}
//
//-(id)initDelBarButtonItemWithTarget:(id)target action:(SEL)action
//{
//    self = [super init];
//    if (self != nil){
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, 30, 20);
//        button.backgroundColor = [UIColor clearColor];
//        [button setBackgroundImage:[UIImage imageNamed:@"delup.png"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"deldown.png"] forState:UIControlStateHighlighted];
//        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        
//        self.customView = button;
//    }
//    
//    return self; 
//}
//
//-(id)initSaveBarButtonItemWithTarget:(id)target action:(SEL)action
//{
//    self = [super init];
//    if (self != nil){
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, 30, 20);
//        button.backgroundColor = [UIColor clearColor];
//        [button setBackgroundImage:[UIImage imageNamed:@"saveiconup.png"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"saveicondown.png"] forState:UIControlStateHighlighted];
//        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        
//        self.customView = button;
//    }
//    
//    return self; 
//}

@end
