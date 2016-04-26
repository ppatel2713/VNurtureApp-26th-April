//
//  AddTutor.h
//  VNurture App
//
//  Created by Prachi on 22/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTutor : UIViewController<UITextViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewAddTutor;

- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDOB;
@property (weak, nonatomic) IBOutlet UITextField *textFieldGender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailId;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCompanyName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UITextView *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
- (IBAction)buttonSubmit:(id)sender;
- (IBAction)buttonCancel:(id)sender;

@end
