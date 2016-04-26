//
//  EditTutorDetails.h
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTutorDetails : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UIView *viewEditTutor;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
@property(weak,nonatomic) NSString *id1;
- (IBAction)replyEditTutor:(id)sender;

@end
