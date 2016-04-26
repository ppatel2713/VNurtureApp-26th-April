//
//  BatchDetail.m
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "BatchDetail.h"
#import "RootViewController.h"

static BatchDetail *sharedInstance;


@interface BatchDetail ()
{
    UIDatePicker *datePickerAddNotice;
    NSString *selectedDate;
    UIDatePicker *timePickerAddNotice;
    NSString *selctedTime;
    NSArray *arrTechnology;
    UIPickerView *pickerViewTechnology;
    NSString *selctedTechnology;
    NSString *tempTechnologyString;

}

@end

@implementation BatchDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewBatchDetails.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewBatchDetails addSubview:imageView];
    [_viewBatchDetails sendSubviewToBack:imageView];
    _textFieldDate.delegate = self;
    _textFieldTime.delegate = self;
    self.textFieldTechnology.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}



- (IBAction)replyBatchDetail:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
