###使用方法



    
    - (void)viewDidLoad {
    [super viewDidLoad];

    //使用方法

    HUDatePicerView *he = [[HUDatePicerView alloc] initWithDateFormat:nil mode:HUDatePickerModeDate maxDate:nil minDate:nil style:1];
    d
    he.delegate = self;
    
    [self.view addSubview:he];
     //代理事件
    - (void)getRestlt:(NSString *)dateStr tag:(NSInteger)tag{
    NSLog(@"%@",dateStr);
    }

    
****
