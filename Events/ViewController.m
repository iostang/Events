//
//  ViewController.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "ViewController.h"
#import "EventManager.h"
#import "EventDataCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *results = [[EventManager shared] drives: [EventDataCenter testDatas:self.description]];
    NSLog(@"%@",results);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
   
    NSNumber *num = [[EventManager shared] drive: [EventDataCenter testData:self.description]];
    BOOL result = num.boolValue;
    
    [self show:result];
    
}



#pragma mark - Private Method

- (void)show:(BOOL)result {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证结果"
                                                                   message:[NSString stringWithFormat:@"是否超时 %@", result ? @"【是】": @"【否】"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"🆗"
                                                     style: UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:true completion:nil];
    
}

@end
