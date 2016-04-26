//
//  HRFeedbackLayout.m
//  VNurture App
//
//  Created by Prachi on 15/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "HRFeedbackLayout.h"
#import "FeedbackDetail.h"
@interface HRFeedbackLayout ()

@end

@implementation HRFeedbackLayout

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    _feedback_Table.dataSource=self;
    _feedback_Table.delegate=self;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/feedbackfetch.php"];
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
        my_array=[json valueForKeyPath:@"contents.content"];
        
        NSLog(@"dictionary data%@",my_array);
        [self.feedback_Table reloadData];
        
        
    }];
    
    [postDataTask resume];

   // my_array=[[NSMutableArray alloc]initWithObjects:@"Vihas Shah",@"Mehul Panchal",@"Shyam Chawda",nil];
    NSLog(@"HEllo	");

    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return my_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.adjustsFontSizeToFitWidth=NO;
    UIFont *myFont = [ UIFont fontWithName: @"Noteworthy" size: 18.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.text=[my_array objectAtIndex:indexPath.row];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(cell.frame.origin.x + 250, cell.frame.origin.y, 50, 50);
    [button setTitle:@"View" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Noteworthy" size:18.0];
    [button addTarget:self action:@selector(staypressed:) forControlEvents:UIControlEventTouchUpInside];
    // button.tintColor=[UIColor whiteColor];
    // button.backgroundColor= [UIColor orangeColor];
    [cell.contentView addSubview:button];
    return cell;
}
-(IBAction)staypressed:(id)sender
{
    FeedbackDetail *obj_FeedbackDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"FeedbackDetail"];
    
    [self presentViewController:obj_FeedbackDetail animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *temp_path = @[indexPath];
        //[_student_table beginUpdates];
        [my_array removeObjectAtIndex:indexPath.row];
        
        [self.feedback_Table  deleteRowsAtIndexPaths:temp_path withRowAnimation:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
