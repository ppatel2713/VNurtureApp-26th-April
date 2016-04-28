//
//  EditStudentDetail.m
//  VNurture App
//
//  Created by Mehul Panchal on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "EditStudentDetail.h"
#import "RootViewController.h"
#import "StudentLayout.h"
@interface EditStudentDetail ()
{
    UIDatePicker *datePickerAddTutor;
    NSString *selectedDate;
    NSArray *arrTechnology;
    UIPickerView *pickerViewTechnology;
    NSString *selctedTechnology;
    NSString *tempTechnologyString;
}
@end

@implementation EditStudentDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"Identifier%d",id1);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/studentallfetch.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    
    NSString * post =[NSString stringWithFormat:@"lang=%@",@"English"];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO	];
    
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        my_array=[json valueForKey:@"students"];
        
        NSLog(@"dictionary data%@",my_array[id1]);
        
        _textFieldCollege.text=[my_array[id1] objectForKey:@"yearschool"];
        _textFieldDate.text=[my_array[id1] objectForKey:@"dob"];
        _textFieldEmailID.text=[my_array[id1] objectForKey:@"email"];
        _textFieldName.text=[my_array[id1] objectForKey:@"firstname"];
        _textFieldPhoneNo=[my_array[id1] objectForKey:@"phone"];
        _textFieldUniversity=[my_array[id1] objectForKey:@"university"];
    
        
        
    }];
    [postDataTask resume];

    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:
                              _viewEditStudent.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewEditStudent addSubview:imageView];
    [_viewEditStudent sendSubviewToBack:imageView];
    arrTechnology = [[NSArray alloc] initWithObjects:@"iOS",@"Android",@".NET",@"PHP", nil];
    pickerViewTechnology=[[UIPickerView alloc] init];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.textFieldDate.delegate = self;
    self.textFieldTechnology.delegate = self;
    pickerViewTechnology.delegate = self;
    pickerViewTechnology.dataSource = self;
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
    _textFieldTechnology.inputView = pickerViewTechnology;
    [_textFieldTechnology setInputAccessoryView:doneBar_pickerViewTechnology];
    // Do any additional setup after loading the view.
}

-(void)act_cancel:(id)sender
{
    [_textFieldDate resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    NSLog(@"%@",dateString);
    // self.textFieldTemp = [NSString stringWithFormat:dateString];
    self.textFieldDate.text = selectedDate;
    
    
}
-(void)act_done:(id)sender
{
    self.textFieldDate.text = selectedDate;
    [self.textFieldDate resignFirstResponder];
}
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}
#pragma marks PickerView For gender/technolgy
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
- (IBAction)backPressed:(id)sender {
    /*StudentLayout *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StudentLayout"];
    
    [self presentViewController:vc animated:YES completion:nil];*/
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
