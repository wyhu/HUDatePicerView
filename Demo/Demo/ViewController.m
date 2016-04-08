//
//  ViewController.m
//  Demo
//
//  Created by huweiya on 16/4/8.
//  Copyright © 2016年 bj_5i5j. All rights reserved.
//

#import "ViewController.h"
#import "HUDatePicerView.h"

@interface ViewController ()<HUDateDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HUDatePicerView *he = [[HUDatePicerView alloc] initWithDateFormat:nil mode:HUDatePickerModeDate maxDate:nil minDate:nil style:1];
    
    he.delegate = self;
    
    [self.view addSubview:he];
    
}
- (void)getRestlt:(NSString *)dateStr tag:(NSInteger)tag{
    NSLog(@"%@",dateStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
