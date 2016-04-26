//
//  AddTutor.m
//  VNurture App
//
//  Created by Prachi on 22/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "AddTutor.h"
#import "RootViewController.h"

@interface AddTutor ()
{
    UIDatePicker *datePickerAddTutor;
    NSString *selectedDate;
    NSArray *arrGender;
    UIPickerView *pickerViewGender;
    NSString *selctedGender;
    NSString *tempGenderString;
    NSArray *arrTechnology;
    UIPickerView *pickerViewTechnology;
    NSString *selctedTechnology;
    NSString *tempTechnologyString;
}
@property(strong,nonatomic)UITextField *textFieldTemp;

@end

@implementation AddTutor

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewAddTutor.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewAddTutor addSubview:imageView];
    [_viewAddTutor sendSubviewToBack:imageView];
    self.navigationController.navigationBarHidden=TRUE;
    arrGender = [[NSArray alloc] initWithObjects:@"Male",@"Female",nil];
    arrTechnology = [[NSArray alloc] initWithObjects:@"iOS",@"Android",@".NET",@"PHP", nil];
    self.textFieldAddress.delegate = self;
    self.textFieldDate.delegate = self;
    self.textFieldDOB.delegate = self;
    self.textFieldGender.delegate = self;
    self.textFieldTechnology.delegate = self;
    pickerViewGender = [[UIPickerView alloc] init];
    pickerViewTechnology = [[UIPickerView alloc] init];
    pickerViewGender.delegate=self;
    pickerViewGender.dataSource=self;
    pickerViewTechnology.dataSource = self;
    pickerViewTechnology.delegate = self;
#pragma marks datePicker
    datePickerAddTutor=[[UIDatePicker alloc] initWithFrame:CGRectZero];
    [datePickerAddTutor setDatePickerMode:UIDatePickerModeDate];
    [datePickerAddTutor addTarget:self action:@selector(dateIsChanged:) forControlEvents:UIControlEventValueChanged];
    UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [doneBar setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem *btn_cancel = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Cancel"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(act_cancel:)];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    [doneBar setItems: [NSArray arrayWithObjects:btn_cancel,flexSpace, [[UIBarButtonItem alloc]
                                                                        initWithTitle:@"Done"
                                                                        style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(act_done:)],nil ] animated:YES];
#pragma marks PickerView Gender
    UIToolbar *doneBar_pickerViewGender = [[UIToolbar alloc] initWithFrame:CGRectMake(10, 10, 320, 44)];
    [doneBar_pickerViewGender setBarStyle:UIBarStyleBlackTranslucent];
    UIBarButtonItem *btn_cancelPicker = [[UIBarButtonItem alloc]
                                         initWithTitle:@"Cancel"
                                         style:UIBarButtonItemStyleDone
                                         target:self
                                         action:@selector(act_cancelPickerView:)];
    
    UIBarButtonItem *flexSpacePicker = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    [doneBar_pickerViewGender setItems: [NSArray arrayWithObjects:btn_cancelPicker,flexSpacePicker, [[UIBarButtonItem alloc]
                                                                                                     initWithTitle:@"Done"
                                                                                                     style:UIBarButtonItemStyleDone
                                                                                                     target:self
                                                                                                     action:@selector(act_donePickerView:)],nil ] animated:YES];
#pragma marks PickerView Technology
    UIToolbar *doneBar_pickerViewTechnology = [[UIToolbar alloc] initWithFrame:CGRectMake(10, 10, 320, 44)];
    [doneBar_pickerViewTechnology setBarStyle:UIBarStyleBlackTranslucent];
    UIBarButtonItem *btn_cancelTechnology = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Cancel"
                                             style:UIBarButtonItemStyleDone
                                             target:self
                                             action:@selector(act_cancelTechnology:)];
    
    UIBarButtonItem *flexSpaceTechnology = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    [doneBar_pickerViewTechnology setItems: [NSArray arrayWithObjects:btn_cancelTechnology,flexSpaceTechnology, [[UIBarButtonItem alloc]
                                                                                                                 initWithTitle:@"Done"
                                                                                                                 style:UIBarButtonItemStyleDone
                                                                                                                 target:self
                                                                                                                 action:@selector(act_doneTechnology:)],nil ] animated:YES];
    _textFieldDate.inputView = datePickerAddTutor;
    [_textFieldDate setInputAccessoryView:doneBar];
    _textFieldDOB.inputView = datePickerAddTutor ;
    [_textFieldDOB setInputAccessoryView:doneBar];
    _textFieldGender.inputView = pickerViewGender;
    [_textFieldGender setInputAccessoryView:doneBar_pickerViewGender];
    _textFieldTechnology.inputView = pickerViewTechnology;
    [_textFieldTechnology setInputAccessoryView:doneBar_pickerViewTechnology];
}
#pragma marks PickerView For gender/technolgy
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:pickerViewGender])
    {
        return arrGender.count;
    }
    else if ([pickerView isEqual:pickerViewTechnology])
    {
        return arrTechnology.count;
    }
    return 0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:pickerViewGender])
    {
        selctedGender = [arrGender objectAtIndex:row];
        return selctedGender;
    }
    else if ([pickerView isEqual:pickerViewTechnology])
    {
        selctedTechnology = [arrTechnology objectAtIndex:row];
        return selctedTechnology;
    }
    return nil;
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([pickerView isEqual:pickerViewGender])
    {
        tempGenderString = [arrGender objectAtIndex:row];
        selctedGender = tempGenderString;
    }
    else if ([pickerView isEqual:pickerViewTechnology])
    {
        tempTechnologyString = [arrTechnology objectAtIndex: row];
        selctedTechnology = tempTechnologyString;
    }
    
}

#pragma marks actions of bars DatePicker
-(void)act_cancel:(id)sender
{
    [_textFieldTemp resignFirstResponder];
}

-(void)act_done:(id)sender
{
    self.textFieldTemp.text = selectedDate;
    [self.textFieldTemp resignFirstResponder];
}

#pragma marks actions of bars PickerView Gender
-(void)act_cancelPickerView:(id)sender
{
    [_textFieldGender resignFirstResponder];
}

-(void)act_donePickerView:(id)sender
{
    self.textFieldGender.text = selctedGender;
    [self.textFieldGender resignFirstResponder];
}

#pragma marks actions of bars Pickerview Technology
-(void)act_cancelTechnology:(id)sender
{
    [_textFieldTechnology resignFirstResponder];
}

-(void)act_doneTechnology:(id)sender
{
    self.textFieldTechnology.text = selctedTechnology;
    [self.textFieldTechnology resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dateIsChanged:(id)sender
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    selectedDate= [dateFormat stringFromDate:[sender date]];
}

#pragma marks TextfieldDelegates

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    NSLog(@"%@",dateString);
    if ([textField isEqual: self.textFieldDOB])
    {
        
        self.textFieldTemp = self.textFieldDOB;
    }
    else if ([textField isEqual: self.textFieldDate])
    {
        self.textFieldTemp = self.textFieldDate;
    }
    
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.textFieldAddress.text=@"";
    return true;
}
-(void)backPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}
- (IBAction)buttonSubmit:(id)sender {
    
    if (((self.textFieldName.text.length > 0) && (self.textFieldDate.text.length>0)) && (self.textFieldDOB.text.length>0) && (self.textFieldEmailId.text.length>0)
        && (self.textFieldGender.text.length>0) && (self.textFieldPassword.text.length>0)  &&  (self.textFieldPhoneNumber.text.length>0) && (self.textFieldTechnology.text.length>0) && (self.textFieldUsername.text.length>0) ) {
        NSLog(@"Checked");
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill up the whole information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
}

- (IBAction)buttonCancel:(id)sender {
}
@end