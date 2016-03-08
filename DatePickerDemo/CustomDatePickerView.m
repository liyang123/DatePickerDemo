
//
//  CustomDatePickerView.m
//  DatePickerDemo
//
//  Created by liyang on 16/3/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "CustomDatePickerView.h"

@interface CustomDatePickerView ()

/** 时间控制器 */
@property (nonatomic, strong) UIDatePicker *datePick;
/** 自定义的工具条 */
@property (nonatomic, strong) UIView *toolView;

@end

@implementation CustomDatePickerView

- (UIDatePicker *)datePick {
    if (!_datePick) {
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.frame = CGRectMake(0, 20, self.bounds.size.width, 220);
        datePicker.backgroundColor = [UIColor lightGrayColor];
        // 设置中文
        [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
        // 设置DatePicker的日历。 默认为当天。
        [datePicker setCalendar:[NSCalendar currentCalendar]];
        //日期/时间选取器支持4种不同模式的选择方式。通过设置 datePickerMode 属性，可以定义选择模式
        datePicker.datePickerMode = UIDatePickerModeDate;
        [self addSubview:datePicker];
        self.datePick = datePicker;
    }
    return _datePick;
}
- (UIView *)toolView {
    if (!_toolView) {
        UIView *toolView = [[UIView alloc] init];
        toolView.frame = CGRectMake(0, 0, self.bounds.size.width, 20);
        [self addSubview:toolView];
        // 取消的按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 7000;
        button.frame = CGRectMake(0, 0, 70, 20);
        [button setTitle:@"cancle" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:button];
        // 确定的按钮
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.tag = 7001;
        [button2 setTitle:@"sure" forState:UIControlStateNormal];
        button2.frame = CGRectMake(toolView.bounds.size.width - 70, 0, 70, 20);
        [button2 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:button2];
        // 赋值
        self.toolView = toolView;
    }
    return _toolView;
}
+ (instancetype)customDatePickerView {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)setDict:(NSDictionary *)dict {
    if (_dict != dict) {
        _dict = dict;
    }
    NSDate *maxDate = dict[@"maxDate"];
    NSDate *minDate = dict[@"minDate"];
    self.datePick.maximumDate = maxDate;
    self.datePick.minimumDate = minDate;
    self.toolView.backgroundColor = [UIColor lightGrayColor];
}

- (void)button:(UIButton *)sender {
    NSDate *date = self.datePick.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeStr = [formatter stringFromDate:date];
    
    if (sender.tag == 7001) {
        self.block(timeStr);
    }else if(sender.tag == 7000){
        self.block(@"");
    }
    
    // 移除
    [self.datePick removeFromSuperview];
    [self.toolView removeFromSuperview];
}

@end
