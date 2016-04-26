//
//  TutorLayout.m
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "TutorLayout.h"
#import "EditTutorDetails.h"

@interface TutorLayout ()

@end

@implementation TutorLayout

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    _tutor_table.dataSource = self;
    _tutor_table.delegate = self;
    
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
        
        NSLog(@"Json%@",json);
        my_array=[json valueForKeyPath:@"tutors.firstname"];
        
        NSLog(@"dictionary data%@",my_array);
        [self.tutor_table reloadData];
        
        
    }];
    
    [postDataTask resume];

    
   // my_array=[[NSMutableArray alloc]initWithObjects:@"Vihas Shah",@"Mihir Mehta",@"Shyam Chawda",@"Ketan Panchal",@"Mehul Panchal",nil];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditTutorDetails *EditTutorDetails1 = [[EditTutorDetails alloc] init];
    NSLog(@"Karannn%@",indexPath);
   // EditTutorDetails1.id1 = ;
    //[self pushViewController:viewControllerB animated:YES];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[my_array objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = NO;
    UIFont *myFont = [ UIFont fontWithName: @"Noteworthy" size: 18.0 ];
    cell.textLabel.font  = myFont;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(cell.frame.origin.x + 250, cell.frame.origin.y, 30, 50);
    [button setTitle:@"Edit" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Noteworthy" size:18.0];
    [button addTarget:self action:@selector(staypressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(IBAction)staypressed:(id)sender
{
    EditTutorDetails *obj_EditTutorDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"EditTutorDetails"];
    [self presentViewController:obj_EditTutorDetails animated:YES completion:nil];
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
        [my_array removeObjectAtIndex:indexPath.row];
        [self.tutor_table deleteRowsAtIndexPaths:temp_path withRowAnimation:YES];
    }
}

@end