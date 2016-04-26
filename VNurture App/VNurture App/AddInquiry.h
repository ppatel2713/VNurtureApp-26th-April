//
//  AddInquiry.h
//  VNurture App
//
//  Created by Prachi on 23/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddInquiry : UIViewController<UITextFieldDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UIView *viewAddInquiry;
- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDOB;
@property (weak, nonatomic) IBOutlet UITextField *textFieldGender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
@property (weak, nonatomic) IBOutlet UITextView *textViewAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailId;
@property (weak, nonatomic) IBOutlet UITextField *textFieldParentNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUniversity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCourse;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSemester;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCollegeName;
- (IBAction)buttonSubmit:(id)sender;

@end
