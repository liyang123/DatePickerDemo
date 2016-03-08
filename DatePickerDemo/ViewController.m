//
//  ViewController.m
//  DatePickerDemo
//
//  Created by liyang on 16/3/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePickerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)customDateView {
    CustomDatePickerView *customView = [CustomDatePickerView customDatePickerView];
    customView.backgroundColor = [UIColor orangeColor];
    customView.frame = CGRectMake(0, self.view.bounds.size.height - 240, self.view.bounds.size.width, 240);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *maxDateString = @"2016-03-08";
    NSString *minDateString = @"2016-04-08";
    NSDate *minimumDate = [formatter dateFromString:maxDateString];
    NSDate *maximumDate = [formatter dateFromString:minDateString];
    NSDictionary *dic = @{@"maxDate":maximumDate, @"minDate":minimumDate};
    customView.dict = dic;
    __weak CustomDatePickerView *cus = customView;
    customView.block = ^(NSString *dateString){
        if (dateString) {
            self.dateLabel.text = dateString;
            [cus removeFromSuperview];
            NSLog(@"%@", self.view.subviews);
        }
    };
    [self.view addSubview:customView];
}



- (IBAction)datePicker:(id)sender {
    // UIDatePicker 使用起来比标准 UIPickerView 更简单。他会根据你指定的日期范围创建自己的数据源。使用它只需要创建一个对象
    // 注意：选取器的高度始终是216像素，要确定分配了足够的空间来容纳
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 216, self.view.bounds.size.width, 216)];
    datePicker.tag = 2000;
    datePicker.backgroundColor = [UIColor lightGrayColor];
    // 设置中文
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    // 设置DatePicker的日历。 默认为当天。
    [datePicker setCalendar:[NSCalendar currentCalendar]];
    //日期/时间选取器支持4种不同模式的选择方式。通过设置 datePickerMode 属性，可以定义选择模式
    datePicker.datePickerMode = UIDatePickerModeDate;
    // 你可以通过设置mininumDate 和 maxinumDate 属性，来指定使用的日期范围。如果用户试图滚动到超出这一范围的日期，表盘会回滚到最近的有效日期。两个方法都需要NSDate 对象作参数
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *maxDateString = @"2016-03-08";
    NSString *minDateString = @"2016-04-08";
    datePicker.minimumDate = [formatter dateFromString:maxDateString];
    datePicker.maximumDate = [formatter dateFromString:minDateString];
    // 由于日期选择器是 UIControl的子类 (与UIPickerView不同)，你还可以在UIControl类的通知结构中挂接一个委托
    
    [self.view addSubview:datePicker];
    
    UIView *view = [[UIView alloc] init];
    view.tag = 3000;
    view.frame = CGRectMake(0, self.view.bounds.size.height - 216 - 20, self.view.bounds.size.width, 20);
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 70, 20);
    [button setTitle:@"cancle" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"sure" forState:UIControlStateNormal];
    button2.frame = CGRectMake(view.bounds.size.width - 70, 0, 70, 20);
    [button2 addTarget:self action:@selector(button2:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button2];
    
}
- (void)button:(UIButton *)sender {
    UIDatePicker *picker = (UIDatePicker *)[self.view viewWithTag:2000];
    [self dateChange:picker];
}
- (void)button2:(UIButton *)sender {
    UIDatePicker *picker = (UIDatePicker *)[self.view viewWithTag:2000];
    [self dateChange:picker];
}

- (void)dateChange:(UIDatePicker *)sender
{
    UIDatePicker *picker = (UIDatePicker *)sender;
    NSDate *date = picker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [formatter stringFromDate:date];
    NSLog(@"%@", timeStr);
    [picker removeFromSuperview];
    
    UIView *view = [self.view viewWithTag:3000];
    [view removeFromSuperview];
}



@end
