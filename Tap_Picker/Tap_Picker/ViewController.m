//
//  ViewController.m
//  Tap_Picker
//
//  Created by Vincent on 14-8-20.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "ViewController.h"
#import "PopPicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_sexField setDisplayData:@[@[@"lili",@"titi"],@[@"gg",@"mm"]] AndGetSelectedData:^(NSArray *indexs) {
        NSLog(@"--->%@",indexs);
    }];
    
    [_nameField setDisplayData:@[@[@"1",@"2",@"3",@"4"],@[@"g",@"4"]] AndGetSelectedData:^(NSArray *indexs) {
        NSLog(@"--->%@",indexs);
    }];
    [_nameField setToolBarColor:[UIColor redColor]];
    [_nameField setPickerBgColor:[UIColor greenColor]];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    PopPicker *pop = [[PopPicker alloc] initWithPickDatas:@[@[@"1",@"2",@"3",@"4"],@[@"g",@"4"],@[@"feng",@"li"]] AndGetSelectedIndexs:^(NSArray *selectedArray) {
        
        NSLog(@"%@",selectedArray);
    }];
}
@end
