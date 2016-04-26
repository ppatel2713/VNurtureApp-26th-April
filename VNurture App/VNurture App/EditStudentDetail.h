//
//  EditStudentDetail.h
//  VNurture App
//
//  Created by Mehul Panchal on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditStudentDetail : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UIView *viewEditStudent;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;

@end
