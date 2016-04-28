//
//  EditStudentDetail.h
//  VNurture App
//
//  Created by Mehul Panchal on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditStudentDetail : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    @public
    int id1;
    NSDictionary *json;
    NSArray *my_array;
}
- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UIView *viewEditStudent;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailID;

@property (weak, nonatomic) IBOutlet UITextField *textFieldUniversity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCourse;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCollege;

@property (weak, nonatomic) IBOutlet UITextView *textViewAddress;

@end
