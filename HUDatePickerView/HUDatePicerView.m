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
- (instancetype)initWithDateFormat:(NSString *)dateFormat mode:(HUDatePickerMode)mode maxDate:(NSDate *)maxDate minDate:(NSDate *)minDate style:(style)style
{
    self = [super initWithFrame:CGRectMake(0, 0, WIDTH1, HEIGHT1)];
    if (self) {
        
        
        if (!dateFormat) {
            dateFormat = @"yyyy-MM-dd";
        }
        
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
        
        
        UIView *bottomView = [[UIView alloc] init];
        
        bottomView.backgroundColor = MJColor(229, 228, 235);
        
        [self   addSubview:bottomView];
        
        
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        
        datePicker.backgroundColor = [UIColor whiteColor];
        
        [bottomView addSubview:datePicker];
        
        [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
        
        
        //取消按钮
        UIButton *btn = [self btnFactoryTitle:@"取消" tag:200];
        
        
        [bottomView addSubview:btn];
        
        
        //确定按钮
        UIButton *sureBtn = [self btnFactoryTitle:@"确定" tag:201];
        
        [bottomView addSubview:sureBtn];
        
        if (!style) {
            style = sheet;
        }
        
        
        switch (style) {
            case 0:
            {
                
                CGFloat bottomWidth = WIDTH1;
                
                CGFloat bottomHeight = 45 + 200*WSCALE6P;
                
                
                //底部
                bottomView.frame = CGRectMake(0, HEIGHT1 - bottomHeight,bottomWidth , bottomHeight);
                
                datePicker.frame = CGRectMake(0, 45,bottomWidth, bottomHeight - 45);
                
                
                
                btn.frame = CGRectMake(0, 0, (bottomWidth - 1) / 2, 45);
                
                sureBtn.frame = CGRectMake(btn.frame.size.width + 1, 0,btn.frame.size.width, 45);
                
            }
                break;
            case 1:
            {
                //中部
                
                
                bottomView.layer.masksToBounds = YES;
                
                bottomView.layer.cornerRadius = 7.0 *WSCALE6P;
                
                
                
                CGFloat bottomWidth = WIDTH1 - 55 *2 *WSCALE6P;
                
                CGFloat bottomHeight = 45 +  280*WSCALE6P;
                
                
                //底部
                bottomView.frame = CGRectMake(55 * WSCALE6P, (HEIGHT1 - bottomHeight)/2- 45 ,bottomWidth , bottomHeight);
                
                
                datePicker.frame = CGRectMake(0, 0,bottomWidth, bottomHeight - 45);
                
                
                
                btn.frame = CGRectMake(0, bottomHeight - 45, (bottomWidth - 1) / 2, 45);
                
                sureBtn.frame = CGRectMake(btn.frame.size.width + 1, bottomHeight - 45, btn.frame.size.width, 45);
                
                
                
            }
                break;
                
                
            default:
                break;
        }
        
        
        
        
        
        
        //设置时间范围
        if (maxDate) {
            datePicker.maximumDate = maxDate;
        }
        
        if (minDate) {
            datePicker.minimumDate = minDate;
        }
        
        
        if (!mode) {
            mode = HUDatePickerModeDate;
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

- (UIButton *)btnFactoryTitle:(NSString *)title tag:(NSInteger)tag_
{
    
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setTitle:title forState:0];
    
    [btn setTitleColor:MJColor(85, 60, 129) forState:0];
    
    btn.backgroundColor = MJColor(235, 234, 241);
    
    btn.tag = tag_;
    
    btn.titleLabel.font = Font(17);
    
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
    
}

@end
