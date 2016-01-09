//
//  ViewController.m
//  WXGraphicMix
//
//  Created by 潇 on 16/1/7.
//  Copyright © 2016年 潇. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+Emoji.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"你是疯子s010,我是傻子s011,疯疯傻傻一辈子s012;你是疯子s010,我是傻子s011,疯疯傻傻一辈子s012;你是疯子s010,我是傻子s011,疯疯傻傻一辈子s012;你是疯子s010,我是傻子s011,疯疯傻傻一辈子s012;你是疯子s010,我是傻子s011,疯疯傻傻一辈子s012;";
    
    self.myLabel.attributedText =[NSAttributedString emojiStringWithString:[[NSMutableAttributedString alloc] initWithString:str]];
    
    self.myLabel.font = [UIFont boldSystemFontOfSize:23];
    
}



@end
