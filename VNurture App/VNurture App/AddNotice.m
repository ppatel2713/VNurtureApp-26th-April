//
//  AddNotice.m
//  VNurture App
//
//  Created by Mehul Panchal on 24/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "AddNotice.h"
#import "RootViewController.h"

@interface AddNotice ()
{
    UIDatePicker *datePickerAddNotice;
    NSString *selectedDate;
    UIDatePicker *timePickerAddNotice;
    NSString *selctedTime;
}
@end

@implementation AddNotice

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewAddNotice.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
     imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewAddNotice addSubview:imageView];
    [_viewAddNotice sendSubviewToBack:imageView];
    self.textFieldDate.delegate = self;
    self.textFieldTime.delegate=self;
    self.textViewNotice.delegate = self;
    datePickerAddNotice=[[UIDatePicker alloc] initWithFrame:CGRectZero];
    [datePickerAddNotice setDatePickerMode:UIDatePickerModeDate];
    [datePickerAddNotice addTarget:self action:@selector(dateIsChanged:) forControlEvents:UIControlEventValueChanged];
    timePickerAddNotice=[[UIDatePicker alloc] initWithFrame:CGRectZero];
    [timePickerAddNotice setDatePickerMode:UIDatePickerModeTime];
    [timePickerAddNotice addTarget:self action:@selector(timeIsChanged:) forControlEvents:UIControlEventValueChanged];
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
    _textFieldDate.inputView = datePickerAddNotice;
    [_textFieldDate setInputAccessoryView:doneBar];
    _textFieldTime.inputView = timePickerAddNotice;
    [_textFieldTime setInputAccessoryView:doneBarTime];
    // Do any additional setup after loading the view.
}

-(void)act_cancel:(id)sender
{
    [_textFieldDate resignFirstResponder];
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
-(void)act_done:(id)sender
{
    self.textFieldDate.text = selectedDate;
    [self.textFieldDate resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.textViewNotice.text=@"";
    return true;
}
-(void)dateIsChanged:(id)sender
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    selectedDate= [dateFormat stringFromDate:[sender date]];
}
-(void)timeIsChanged:(id)sender
{
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"hh:mm a"];
   selctedTime = [timeFormat stringFromDate:[sender date]];
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
- (IBAction)buttonCreate:(id)sender {
    
    
    if (((self.textFieldDate.text.length > 0) && (self.textFieldTime.text.length>0)) && (self.textViewNotice.text.length>0)) {
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/noticeinsert.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        //[request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        
        NSArray *data=[NSArray arrayWithObjects:_textViewNotice.text,nil];
        NSArray *key=[NSArray arrayWithObjects:@"noticeContent", nil];
        
        
        
        NSDictionary *noticeData=[NSDictionary dictionaryWithObjects:data forKeys:key];
        
        NSLog(@"Notice Data%@",noticeData);
        NSData *postData = [NSJSONSerialization dataWithJSONObject:noticeData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
        }];
        
        [postDataTask resume];
        NSLog(@"Checked");
        
        NSLog(@"Checked");
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Please fill up the whole information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
