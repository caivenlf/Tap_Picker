//
//  PopPicker.h
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopPickerView.h"

typedef void(^getSelectedIndex)(NSArray *selectedArray);
@interface PopPicker : NSObject{
    getSelectedIndex returnSelectedIndex;
}

/*!
 @function 点击事件出发初始化pickerView。
 @param datas -> 用户传入的picker的datasource,格式:@[@[@"1",@"2",...]@[@"l",@"k",...]]
 @param indexs -> 返回点击的结果，a[0]表示第一列，以此类推...
 */
- (id)initWithPickDatas:(NSArray *)datas AndGetSelectedIndexs:(getSelectedIndex)indexs;


@end
