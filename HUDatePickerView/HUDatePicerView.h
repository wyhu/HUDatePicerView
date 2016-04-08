//
//  HUDatePicerView.h
//  HU_DatePacker
//
//  Created by huweiya on 16/4/7.
//  Copyright © 2016年 bj_5i5j. All rights reserved.
//


typedef enum{
    HUDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
    HUDatePickerModeDate,           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
    HUDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
    HUDatePickerModeCountDownTimer, // Displays hour and minute (e.g. 1 | 53)
}HUDatePickerMode;


#import <UIKit/UIKit.h>



typedef void(^Hu_dataBlock)(NSString *data);





@protocol HUDateDelegate <NSObject>

@required

- (void)getRestlt:(NSString *)dateStr tag:(NSInteger)tag;

@end

@interface HUDatePicerView : UIView




@property(nonatomic , weak) id <HUDateDelegate> delegate;

- (instancetype)initWithDateFormat:(NSString *)dateFormat mode:(HUDatePickerMode)mode maxDate:(NSDate *)maxDate minDate:(NSDate *)minDate;

@end
