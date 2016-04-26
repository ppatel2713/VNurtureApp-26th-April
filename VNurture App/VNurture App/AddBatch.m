//
//  AddBatch.m
//  VNurture App
//
//  Created by Prachi on 23/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "AddBatch.h"
#import "RootViewController.h"

@interface AddBatch ()
{
    UIDatePicker *datePickerAddBatch;
    NSString *selectedDate;
    UIDatePicker *timePickerAddBatch;
    NSString *selctedTime;
    NSArray *arrTechnology;
    UIPickerView *pickerViewTechnology;
    NSString *selctedTechnology;
    NSString *tempTechnologyString;

}
@end

@implementation AddBatch

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewAddBatch.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
     imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewAddBatch addSubview:imageView];
    [_viewAddBatch sendSubviewToBack:imageView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    arrTechnology = [[NSArray alloc] initWithObjects:@"iOS",@"Android",@".NET",@"PHP", nil];
    self.textFieldDate.delegate = self;
    self.textFieldTime.delegate = self;
    self.textFieldTechnology.delegate = self;
    datePickerAddBatch=[[UIDatePicker alloc] initWithFrame:CGRectZero];
    pickerViewTechnology = [[UIPickerView alloc] init];
    [datePickerAddBatch setDatePickerMode:UIDatePickerModeDate];
    [datePickerAddBatch addTarget:self action:@selector(dateIsChanged:) forControlEvents:UIControlEventValueChanged];
    timePickerAddBatch=[[UIDatePicker alloc] initWithFrame:CGRectZero];
    [timePickerAddBatch setDatePickerMode:UIDatePickerModeTime];
    [timePickerAddBatch addTarget:self action:@selector(timeIsChanged:) forControlEvents:UIControlEventValueChanged];
    pickerViewTechnology.dataSource = self;
    pickerViewTechnology.delegate = self;
#pragma marks DatePicker
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
#pragma marks TimePicker
    UIToolbar *doneBarTime = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [doneBarTime setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem *btn_cancelTime = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Cancel"
                                       style:UIBarButtonItemStyleDone
                                       target:self
                                       action:@selector(act_cancelTime:)];
    
    UIBarButtonItem *flexSpaceTime = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    [doneBarTime setItems: [NSArray arrayWithObjects:btn_cancelTime,flexSpaceTime, [[UIBarButtonItem alloc]
                                                                                    initWithTitle:@"Done"
                                                                                    style:UIBarButtonItemStyleDone
                                                                                    target:self
                                                                                    action:@selector(act_doneTime:)],nil ] animated:YES];
#pragma marks TechnologyPicker
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
    _textFieldDate.inputView = datePickerAddBatch;
    [_textFieldDate setInputAccessoryView:doneBar];
    _textFieldTime.inputView = timePickerAddBatch;
    [_textFieldTime setInputAccessoryView:doneBarTime];
    _textFieldTechnology.inputView = pickerViewTechnology;
    [_textFieldTechnology setInputAccessoryView:doneBar_pickerViewTechnology];
}
#pragma  marks PickerView Technology
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
        return arrTechnology.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    selctedTechnology = [arrTechnology objectAtIndex:row];
        return selctedTechnology;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
        tempTechnologyString = [arrTechnology objectAtIndex: row];
        selctedTechnology = tempTechnologyString;
}
#pragma marks actions for DateTime
-(void)act_cancel:(id)sender
{
    [_textFieldDate resignFirstResponder];
}

-(void)act_done:(id)sender
{
    self.textFieldDate.text = selectedDate;
    [self.textFieldDate resignFirstResponder];
}
#pragma marks actions for Technology
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
-(void)act_doneTime:(id)sender
{
    self.textFieldTime.text = selctedTime;
    [self.textFieldTime resignFirstResponder];
}
-(void)act_cancelTime:(id)sender
{
    [_textFieldTime resignFirstResponder];
}
-(void)timeIsChanged:(id)sender
{
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"hh:mm a"];
    selctedTime = [timeFormat stringFromDate:[sender date]];
}
#pragma marks TextField Delegates
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    NSLog(@"%@",dateString);
    // self.textFieldTemp = [NSString stringWithFormat:dateString];
    self.textFieldDate.text = selectedDate;
    /* if ([textField isEqual: self.textFieldDOB])
     {
     
     self.textFieldTemp = self.textFieldDOB;
     }
     else if ([textField isEqual: self.textFieldDate])
     {
     self.textFieldTemp = self.textFieldDate;
     }*/
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

- (IBAction)backPressed:(id)sender {
    RootViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (IBAction)buttonSend:(id)sender {
    if (((self.textFieldBatchName.text.length > 0) && (self.textFieldDate.text.length>0)) && (self.textFieldTime.text.length>0) && (self.textFieldTechnology.text.length>0) && (self.textFieldTutorName.text.length>0) ) {
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/batchinsert.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        //[request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        
        NSArray *data=[NSArray arrayWithObjects:_textFieldBatchName.text,_textFieldDate.text,_textFieldTime.text,nil];
        NSArray *key=[NSArray arrayWithObjects:@"batchname",@"date",@"batchstarttime", nil];
        
        
        
        NSDictionary *batchData=[NSDictionary dictionaryWithObjects:data forKeys:key];
        
        NSLog(@"Batch Data%@",batchData);
        NSData *postData = [NSJSONSerialization dataWithJSONObject:batchData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
        }];
        
        [postDataTask resume];
        
        NSLog(@"Checked");
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Please fill up the whole information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }

}
@end
