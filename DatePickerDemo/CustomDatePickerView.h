//
//  CustomDatePickerView.h
//  DatePickerDemo
//
//  Created by liyang on 16/3/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(NSString *dateString);

@interface CustomDatePickerView : UIView

/** block  */
@property (nonatomic, copy) Block block;

/** 数据 */
@property (nonatomic, strong) NSDictionary *dict;

+ (instancetype)customDatePickerView;

@end
