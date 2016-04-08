//使用方法

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

