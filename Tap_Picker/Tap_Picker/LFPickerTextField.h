//
//  LFPickerTextField.h
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^getSelectedData)(NSArray *indexs);

@interface LFPickerTextField : UITextField<UIPickerViewDelegate, UIPickerViewDataSource>{
    getSelectedData returnSelectedData;
}
/**
 @param toolBarColor toolBar's Color, default's white
 */
@property (nonatomic, strong) UIColor *toolBarColor;
/**
 @param pickerBgColor picker's background Color, default's gray
 */
@property (nonatomic, strong) UIColor *pickerBgColor;
/*!
 @function setDisplayData:AndGetSelectedData:
 @discussion datas传入的结构为(两层数组):@[@[],@[]....] 返回值data为一层数组,第一个值表示picker第一列选中的值，以此类推...
 @param datas ->picker's dataSource @[@[@"1",@"2",...],@[]....]
 @param data ->selected data    @[@(1),@(2)...]
 */
-(void)setDisplayData:(NSArray *)datas AndGetSelectedData:(getSelectedData)data;

@end
