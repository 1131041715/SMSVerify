//
//  ViewController.m
//  SMSVerify
//
//  Created by 大碗豆 on 17/3/29.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ViewController.h"
#import <SMS_SDK/SMSSDK.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@property (weak, nonatomic) IBOutlet UITextField *write;

@property (weak, nonatomic) IBOutlet UIButton *btnGetCode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)btn:(id)sender {
    
    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethodSMS) phoneNumber:self.textFiled.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"获取验证码成功");
        }else {
            NSLog(@"错误信息：%@",error);
        }
    }];
}

- (IBAction)commit:(id)sender {
    
    
    [SMSSDK commitVerificationCode:self.write.text phoneNumber:self.textFiled.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        
        if (!error)
        {
            
            NSLog(@"验证成功");
            UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"结果反馈" message:@"验证成功" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [sheet addAction:ac1];
            [self presentViewController:sheet animated:YES completion:nil];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
