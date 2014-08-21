//
//  PopPickerView.h
//  Tap_Picker
//
//  Created by Vincent on 14-8-21.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^getSelectedData)(NSArray *indexs);
@interface PopPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>{
    getSelectedData returnSelectedData;
}

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic,strong)NSArray *pickerDatas;

- (IBAction)finish:(id)sender;
- (IBAction)cancel:(id)sender;
- (void)getSelectedIndex:(getSelectedData)indexs;

@end
