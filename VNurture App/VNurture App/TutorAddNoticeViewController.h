//
//  TutorAddNoticeViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 18/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorAddNoticeViewController : UIViewController<UITextFieldDelegate>
{
    UIDatePicker *datePickerAddNotice;
    NSString *selectedDate;
    UIDatePicker *timePickerAddNotice;
    NSString *selctedTime;
}
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextView *textViewNotice;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;
- (IBAction)buttonSend:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewTutorAddNotice;
@end
