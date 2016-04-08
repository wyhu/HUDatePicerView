//
//  HUDatePicerView.m
//  HU_DatePacker
//
//  Created by huweiya on 16/4/7.
//  Copyright © 2016年 bj_5i5j. All rights reserved.
//

#import "HUDatePicerView.h"

#define WSCALE6P WIDTH1/414.0
#define HSCALE6P HEIGHT1/736.0

#define Font(size) [UIFont systemFontOfSize:size]
#define MJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#define WIDTH1 [UIScreen mainScreen].bounds.size.width
#define HEIGHT1 [UIScreen mainScreen].bounds.size.height

@implementation HUDatePicerView


{
    NSString *hu_DateFormat;
    
    NSDate *hu_Date;
}
- (instancetype)initWithDateFormat:(NSString *)dateFormat mode:(HUDatePickerMode)mode maxDate:(NSDate *)maxDate minDate:(NSDate *)minDate
{
    self = [super initWithFrame:CGRectMake(0, 0, WIDTH1, HEIGHT1)];
    if (self) {
        
        hu_DateFormat = dateFormat;
        
        hu_Date = [NSDate date];
        
        self.backgroundColor = [UIColor clearColor];
        
        //遮罩视图
        UIView *zheZhao = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH1, HEIGHT1)];
        
        [self addSubview:zheZhao];
        
        zheZhao.alpha = 0.3;
        
        zheZhao.backgroundColor = [UIColor blackColor];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeSelf)];
        [zheZhao addGestureRecognizer:tap];
        
        //取消 确定 按钮所在视图
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT1 - 200*WSCALE6P - 45,WIDTH1 , 45)];
        
        [self addSubview:topView];
        
        CGFloat btnWidth = (WIDTH1 - 1) / 2;
        
        topView.backgroundColor = MJColor(229, 228, 235);
        
        
        UIButton *btn = [self btnFactoryTitle:@"取消"];
        
        btn.frame = CGRectMake(0, 0, btnWidth, 45);
        
        [topView addSubview:btn];
        
        btn.tag = 200;
        
        
        
        
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *sureBtn = [self btnFactoryTitle:@"确定"];
        
        
        sureBtn.frame = CGRectMake(WIDTH1 - btnWidth, 0, btnWidth, 45);
        
        [topView addSubview:sureBtn];
        
        
        sureBtn.tag = 201;
        
        
        [sureBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //初始化pickerView
        UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, HEIGHT1 - 200 *WSCALE6P,WIDTH1, 200*WSCALE6P)];
        [self addSubview:datePicker];
        
        
        //设置时间范围
        if (maxDate) {
            datePicker.maximumDate = maxDate;
        }
        
        if (minDate) {
            datePicker.minimumDate = minDate;
        }
        
        
        //选择类型
        switch (mode) {
            case 0:
            {
                datePicker.datePickerMode = UIDatePickerModeTime;
                
            }
                break;
            case 1:
            {
                datePicker.datePickerMode = UIDatePickerModeDate;
                
            }
                break;
            case 2:
            {
                datePicker.datePickerMode = HUDatePickerModeDateAndTime;
                
            }
                break;
                
            case 3:
            {
                datePicker.datePickerMode = HUDatePickerModeCountDownTimer;
                
            }
                break;
                
                
                
            default:
                break;
        }
        
        datePicker.backgroundColor = [UIColor whiteColor];
        
        
        [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
        
    }
    return self;
}


/**
 *  按钮点击事件
 *
 *  @param btn 按钮
 */
- (void)btnAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 200:
        {
            //取消
            
            [self removeSelf];
        }
            break;
            
        case 201:
        {
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            
            [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
            
            [dateFormat setDateFormat:hu_DateFormat];
            
            NSString *prettyVersion = [dateFormat stringFromDate:hu_Date];
            
            if ([self.delegate respondsToSelector:@selector(getRestlt:tag:) ]) {
                [self.delegate getRestlt:prettyVersion tag:self.tag];
            }
            
            [self removeSelf];
            
            
        }
            break;
            
            
        default:
            break;
    }
}


/**
 *  datePicker相应事件
 *
 *  @param picker picker
 */
- (void)dateChange:(UIDatePicker *)picker
{
    
    hu_Date = picker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    
    [dateFormat setDateFormat:hu_DateFormat];
    
    NSString *prettyVersion = [dateFormat stringFromDate:picker.date];
    
    if ([self.delegate respondsToSelector:@selector(getRestlt:tag:) ]) {
        [self.delegate getRestlt:prettyVersion tag:self.tag];
        
    }
    
    
    
}



/**
 *  移除自己
 */
- (void)removeSelf
{
    
    [self removeFromSuperview];
}

- (UIButton *)btnFactoryTitle:(NSString *)title
{
    
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setTitle:title forState:0];
    
    [btn setTitleColor:MJColor(85, 60, 129) forState:0];
    
    btn.backgroundColor = MJColor(235, 234, 241);
    
    
    
    btn.titleLabel.font = Font(17);
    
    return btn;
    
}

@end
