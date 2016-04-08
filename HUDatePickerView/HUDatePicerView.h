//
//  HUDatePicerView.h
//  HU_DatePacker
//
//  Created by huweiya on 16/4/7.
//  Copyright © 2016年 bj_5i5j. All rights reserved.
//


typedef enum{
    HUDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
    HUDatePickerModeDate, //默认          // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
    HUDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
    HUDatePickerModeCountDownTimer, // Displays hour and minute (e.g. 1 | 53)
}HUDatePickerMode;

/**
 *  类型
 */
typedef enum{
    
    sheet,//默认
    alert
    
}style;


#import <UIKit/UIKit.h>



typedef void(^Hu_dataBlock)(NSString *data);





@protocol HUDateDelegate <NSObject>

@required

/**
 *  代理回调方法
 *
 *  @param dateStr 格式化后的时间
 *  @param tag     tag
 */
- (void)getRestlt:(NSString *)dateStr tag:(NSInteger)tag;

@end

@interface HUDatePicerView : UIView




@property(nonatomic , weak) id <HUDateDelegate> delegate;


/**
 *  构造时间选择器
 *
 *  @param dateFormat 时间转化格式
 *  @param mode       时间模式
 *  @param maxDate    时间最大值
 *  @param minDate    时间最小值
 *  @param style      显示模式（sheet,alert）
 *
 *  @return 时间选择器
 */
- (instancetype)initWithDateFormat:(NSString *)dateFormat mode:(HUDatePickerMode)mode maxDate:(NSDate *)maxDate minDate:(NSDate *)minDate style:(style)style;

@end
