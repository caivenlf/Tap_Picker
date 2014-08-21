//
//  PopPickerView.m
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "PopPickerView.h"

@interface PopPickerView (){
    NSArray *optionDatas;
}
@end
@implementation PopPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib{
    _picker.dataSource = self;
    _picker.delegate = self;
}

- (void)getSelectedIndex:(getSelectedData)indexs{
    returnSelectedData = indexs;
}

- (void)setPickerDatas:(NSArray *)pickerDatas{
    optionDatas = pickerDatas;
    [_picker reloadAllComponents];
}

- (IBAction)finish:(id)sender {
    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:10];
    [tmpArray removeAllObjects];
    for (int i=0; i<[optionDatas count]; i++) {
        NSInteger row = [_picker selectedRowInComponent:i];
        [tmpArray addObject:@(row)];
    }
    if (returnSelectedData) {
        returnSelectedData(tmpArray);
    }
}

- (IBAction)cancel:(id)sender {
    if (returnSelectedData) {
        returnSelectedData(nil);
    }
}

#pragma mark - picker view delegate/datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [optionDatas count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[optionDatas objectAtIndex:component] count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[optionDatas objectAtIndex:component] objectAtIndex:row];
}
@end
