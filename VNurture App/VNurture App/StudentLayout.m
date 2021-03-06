//
//  StudentLayout.m
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "StudentLayout.h"
#import "EditStudentDetail.h"
#import "EditPaymentDetail.h"
#import "FirstViewController.h"
#import "StudentLayout.h"
@interface StudentLayout ()

@end

@implementation StudentLayout

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    self.student_table.dataSource=self;
    _student_table.delegate=self;
    
    
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
        
        NSLog(@"Json%@",json);
        my_array=[json valueForKeyPath:@"students.firstname"];
        
        NSLog(@"dictionary data%@",my_array);
        [self.student_table reloadData];
        
        
    }];
    
    [postDataTask resume];

    
   // my_array=[[NSMutableArray alloc]initWithObjects:@"Prachi Patel",@"Kruti Chauhan",@"Kush Patel",@"Monika Punjabi",@"Dharati Patel" ,@"Karan Shah",@"Ashay Patel",nil];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditStudentDetail  *EditStudentDetails1 = [self.storyboard instantiateViewControllerWithIdentifier:@"EditStudentDetail"];
    NSLog(@"Karannn%ld",(long)indexPath.row);
    EditStudentDetails1->id1 = indexPath.row;
    [self presentViewController:EditStudentDetails1 animated:YES completion:nil];
    
    //[self pushViewController:viewControllerB animated:YES];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return my_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.textLabel.font=[UIFont fontNamesForFamilyName:@"Noteworthy"];
    cell.textLabel.adjustsFontSizeToFitWidth=NO;
    UIFont *myFont = [ UIFont fontWithName: @"Noteworthy" size: 18.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.text=[my_array objectAtIndex:indexPath.row];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(cell.frame.origin.x + 250, cell.frame.origin.y, 30, 50);
    [button setTitle:@"Edit" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Noteworthy" size:18.0];
      [button addTarget:self action:@selector(staypressed:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button_payment = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_payment.frame = CGRectMake(cell.frame.origin.x + 170, cell.frame.origin.y - 20, 70, 90);
    [button_payment setTitle:@"Payment" forState:UIControlStateNormal];
    button_payment.titleLabel.font = [UIFont fontWithName:@"Noteworthy" size:18.0];
    [button_payment addTarget:self action:@selector(staypressed_payment:) forControlEvents:UIControlEventTouchUpInside];
   // button.tintColor=[UIColor whiteColor];
   // button.backgroundColor= [UIColor orangeColor];
    [cell.contentView addSubview:button_payment];
    [cell.contentView addSubview:button];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(IBAction)staypressed:(id)sender
{
    EditStudentDetail *obj_EditStudentDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"EditStudentDetail"];
    
    [self presentViewController:obj_EditStudentDetail animated:YES completion:nil];
}
-(IBAction)staypressed_payment:(id)sender
{
    EditPaymentDetail *obj_EditPaymentDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"EditPaymentDetail"];
    
    [self presentViewController:obj_EditPaymentDetail animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *temp_path = @[indexPath];
        //[_student_table beginUpdates];
        [my_array removeObjectAtIndex:indexPath.row];

        [self.student_table deleteRowsAtIndexPaths:temp_path withRowAnimation:YES];
                //[_student_table endUpdates];
       // [_student_table reloadData];
    }
}

- (IBAction)backStudentDetails:(id)sender {
    FirstViewController *obj_FirstViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    [self presentViewController:obj_FirstViewController animated:YES completion:nil];
}
@end


