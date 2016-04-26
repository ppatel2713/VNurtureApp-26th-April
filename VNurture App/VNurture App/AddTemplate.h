//
//  AddTemplate.h
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTemplate : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTemplate;
@property (weak, nonatomic) IBOutlet UIView *viewAddTemplate;

@end
