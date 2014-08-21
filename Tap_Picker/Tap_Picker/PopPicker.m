//
//  PopPicker.m
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "PopPicker.h"
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface PopPicker (){
    PopPickerView *_popPickView;
}

@end
@implementation PopPicker

- (id)initWithPickDatas:(NSArray *)datas AndGetSelectedIndexs:(getSelectedIndex)indexs{
    self = [super init];
    if (self) {
        [self showPushTimePicker];
        [_popPickView setPickerDatas:datas];
    }
    returnSelectedIndex = indexs;
    return self;
}

- (void)showPushTimePicker{
    
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, kScreenHeight)];
    bgview.tag = 200;
    bgview.backgroundColor = [UIColor clearColor];
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:bgview];
    if (_popPickView == nil) {
        _popPickView = (PopPickerView *)[[[NSBundle mainBundle] loadNibNamed:@"PopPickerView" owner:nil options:nil] objectAtIndex:0];
    }
    [keyWindow addSubview:_popPickView];
    
    _popPickView.frame = CGRectMake(0, kScreenHeight, _popPickView.frame.size.width, _popPickView.frame.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        _popPickView.frame = CGRectMake(0, kScreenHeight-_popPickView.frame.size.height, _popPickView.frame.size.width, _popPickView.frame.size.height);
    }];
    
    [_popPickView getSelectedIndex:^(NSArray *indexs) {
        if (![indexs count]==0) {
            returnSelectedIndex(indexs);
        }
        [self hidePushPicker];
    }];
}

- (void)hidePushPicker{
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *bgView = [keyWindow viewWithTag:200];
    
    [UIView animateWithDuration:0.2 animations:^{
        _popPickView.frame = CGRectMake(0, kScreenHeight, _popPickView.frame.size.width, _popPickView.frame.size.height);
    } completion:^(BOOL finished) {
        [_popPickView removeFromSuperview];
        [bgView removeFromSuperview];
    }];
}

@end
