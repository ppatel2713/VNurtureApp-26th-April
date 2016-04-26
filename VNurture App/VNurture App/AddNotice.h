//
//  AddNotice.h
//  VNurture App
//
//  Created by Mehul Panchal on 24/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNotice : UIViewController<UITextFieldDelegate,UITextViewDelegate>
- (IBAction)backPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;
@property (weak, nonatomic) IBOutlet UITextView *textViewNotice;
- (IBAction)buttonCreate:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewAddNotice;

@end
