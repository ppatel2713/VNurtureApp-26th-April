//
//  EditTutorDetails.m
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "EditTutorDetails.h"

@interface EditTutorDetails ()
{
    UIDatePicker *datePickerAddTutor;
    NSString *selectedDate;
    NSArray *arrTechnology;
    UIPickerView *pickerViewTechnology;
    NSString *selctedTechnology;
    NSString *tempTechnologyString;
}
@end

@implementation EditTutorDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Identifier%d",id1);
    
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/tutorallfetch.php"];
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
        
       my_array=[json valueForKey:@"tutors"];
        
        NSLog(@"dictionary data%@",my_array[id1]);
        
        
        
        _textFieldName.text=[my_array[id1] objectForKey:@"firstname"];
        _textFieldDate.text=[my_array [id1] objectForKey:@"dob"];
        _textFieldCompanyName.text=[my_array[id1] objectForKey:@"compney"];
        _textFieldEmailID.text=[my_array[id1] objectForKey:@"email"];
        _textFieldPhoneNo.text=[my_array[id1] objectForKey:@"phone"];
        _textFieldExperience.text=[my_array[id1] objectForKey:@"experience"];
       // [_textViewAddress setText:[my_array[id1] objectForKey:@"address"]];
    
    }];
    NSLog(@"Json%@",json);
    
    
    
    
    [postDataTask resume];

    
    NSLog(@"Array%@",my_array);

    
    
    
    
    
    
    
    
    
    
    

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewEditTutor.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewEditTutor addSubview:imageView];
    [_viewEditTutor sendSubviewToBack:imageView];
    arrTechnology = [[NSArray alloc] initWithObjects:@"iOS",@"Android",@".NET",@"PHP", nil];
    pickerViewTechnology=[[UIPickerView alloc] init];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.textFieldTechnology.delegate = self;
    pickerViewTechnology.delegate = self;
    pickerViewTechnology.dataSource = self;
    self.textFieldDate.delegate = self;
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
    /* if ([textField isEqual: self.textFieldDOB])
     {
     
     self.textFieldTemp = self.textFieldDOB;
     }
     else if ([textField isEqual: self.textFieldDate])
     {
     self.textFieldTemp = self.textFieldDate;
     }*/
    
}
-(void)act_done:(id)sender
{
    /*if ([_textFieldTemp.text isEqual:@""])
     {
     NSDate *currDate = [NSDate date];
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
     [dateFormatter setDateFormat:@"dd.MM.YY"];
     NSString *dateString = [dateFormatter stringFromDate:currDate];
     NSLog(@"%@",dateString);
     self.textFieldTemp.text = dateString;
     }
     else
     {*/
    self.textFieldDate.text = selectedDate;
    [self.textFieldDate resignFirstResponder];
    // }
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
-(void)act_cancelTechnology:(id)sender
{
    [_textFieldTechnology resignFirstResponder];
}

-(void)act_doneTechnology:(id)sender
{
    self.textFieldTechnology.text = selctedTechnology;
    [self.textFieldTechnology resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}


- (IBAction)replyEditTutor:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
