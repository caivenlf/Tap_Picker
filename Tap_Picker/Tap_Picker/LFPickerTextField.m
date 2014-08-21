//
//  LFPickerTextField.m
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "LFPickerTextField.h"

@interface LFPickerTextField (){
    
    UIPickerView *_picker;
    UIToolbar *_toolbar;
    UIBarButtonItem *_doneButton;
    UIBarButtonItem *_cancelButton;
    
    NSArray *optionDatas;
}
@end

@implementation LFPickerTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)awakeFromNib{
    [self initData];
}

- (void)initData{
    
    _picker = [[UIPickerView alloc] init];
    _picker.delegate = self;
    _picker.dataSource = self;
    _picker.showsSelectionIndicator = YES;
    
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                target:self action:@selector(onDone)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    _cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancel)];
    [_toolbar setItems:[NSArray arrayWithObjects:_doneButton,flexibleSpace,_cancelButton, nil]];
    
    self.inputView = _picker;
    self.inputAccessoryView = _toolbar;
}

- (void)onDone{
    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:10];
    [tmpArray removeAllObjects];
    for (int i=0; i<[optionDatas count]; i++) {
        NSInteger row = [_picker selectedRowInComponent:i];
        [tmpArray addObject:@(row)];
    }
    if (returnSelectedData) {
        returnSelectedData(tmpArray);
    }
    [self resignFirstResponder];
}

- (void)onCancel{
    [self resignFirstResponder];
}

-(void)setDisplayData:(NSArray *)datas AndGetSelectedData:(getSelectedData)data{
    returnSelectedData = data;
    optionDatas = [NSArray arrayWithArray:datas];
}

- (void)setToolBarColor:(UIColor *)toolBarColor{
    UIColor *color = toolBarColor;
    _toolbar.backgroundColor = color;
}

- (void)setPickerBgColor:(UIColor *)pickerBgColor{
    UIColor *color = pickerBgColor;
    _picker.backgroundColor = color;
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
