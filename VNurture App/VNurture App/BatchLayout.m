//
//  BatchLayout.m
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "BatchLayout.h"
#import "BatchDetail.h"
@interface BatchLayout ()

@end

@implementation BatchLayout

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    _batch_table.dataSource=self;
    _batch_table.delegate=self;
    //my_array=[[NSMutableArray alloc]initWithObjects:@"iOS Batch",@".NET Batch",@"php Batch",@"iOS New Summer Batch" ,@"Anroid batch",nil];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/batchallfetch.php"];
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
        my_array=[json valueForKeyPath:@"batch.batchname"];
        
        NSLog(@"dictionary data%@",my_array);
        [self.batch_table reloadData];
        
        
    }];
    
    [postDataTask resume];


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    button.frame = CGRectMake(cell.frame.origin.x + 250, cell.frame.origin.y, 30, 50);
    [button setTitle:@"Edit" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Noteworthy" size:18.0];
    [button addTarget:self action:@selector(staypressed:) forControlEvents:UIControlEventTouchUpInside];
    // button.tintColor=[UIColor whiteColor];
    // button.backgroundColor= [UIColor orangeColor];
    [cell.contentView addSubview:button];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(IBAction)staypressed:(id)sender
{
    BatchDetail *obj_BatchDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"BatchDetail"];
    
    [self presentViewController:obj_BatchDetail animated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
        
        [self.batch_table  deleteRowsAtIndexPaths:temp_path withRowAnimation:YES];
    }
}
@end
