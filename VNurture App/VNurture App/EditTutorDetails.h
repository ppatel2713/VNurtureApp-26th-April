//
//  EditTutorDetails.h
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTutorDetails : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,NSURLSessionDelegate>
{
    @public
    int id1;
    NSDictionary *json;
    NSMutableArray *my_array;

}
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UIView *viewEditTutor;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
- (IBAction)replyEditTutor:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCompanyName;
@property (weak, nonatomic) IBOutlet UITextView *textViewAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailID;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UITextField *textFieldExperience;

@end
