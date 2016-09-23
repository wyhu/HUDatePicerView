# HUDatePicerView 时间选择空间
两种弹出模式：alert,sheet

---

###1.alert（中间弹出）

![image](/Users/sks/Desktop/屏幕快照 2016-09-23 下午2.15.11.png)

    HUDatePicerView *he = [[HUDatePicerView alloc] initWithDateFormat:nil               
    
    mode:HUDatePickerModeDate maxDate:nil minDate:nil style:alert];
    
    he.delegate = self;
    
    [self.view addSubview:he];


 
###2.sheet

![image](/Users/sks/Desktop/屏幕快照 2016-09-23 下午2.15.59.png)


    HUDatePicerView *he = [[HUDatePicerView alloc] initWithDateFormat:nil               
    
    mode:HUDatePickerModeDate maxDate:nil minDate:nil style:sheet];
    
    he.delegate = self;
    
    [self.view addSubview:he];



