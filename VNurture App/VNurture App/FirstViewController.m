//
//  FirstViewController.m
//  VNurture App
//
//  Created by Mehul Panchal on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "FirstViewController.h"
#import "AddTemplate.h"
#import "AddInquiry.h"
#import "AddTutor.h"
#import "AddStudent.h"
#import "AddBatch.h"
#import "AddNotice.h"
static FirstViewController *sharedInstance;

@interface FirstViewController ()
@property (strong, nonatomic) VCFloatingActionButton *addButton;

@end

@implementation FirstViewController
@synthesize addButton;
- (void)viewDidLoad {
    [super viewDidLoad];
   self.homeTable.dataSource = self;
   self.homeTable.delegate = self;
    my_array=[[NSMutableArray alloc]initWithObjects:@"New Batch Has been Added",@"New Notice Request by Vihas Shah",@"New Notice Request by Mihir Mehta",@"New Inquiry Has been Added",nil];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_obj_view.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_obj_view addSubview:imageView];
    [_obj_view sendSubviewToBack:imageView];

    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 20, [UIScreen mainScreen].bounds.size.height - 44 -58 - 20, 44, 44);
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    addButton.imageArray = @[@"student",@"teacher",@"batch",@"notice",@"inquiry"];
    addButton.labelArray = @[@"Add Student",@"Add Tutor",@"Add Batch",@"Add Notice",@"Add Inquiry"];
    addButton.hideWhileScrolling = NO;
    addButton.delegate = self;
   [_homeTable addSubview:addButton];
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
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.adjustsFontSizeToFitWidth=NO;
    UIFont *myFont = [ UIFont fontWithName: @"Noteworthy" size: 18.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.text=[my_array objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

-(void) didSelectMenuOptionAtIndex:(NSInteger)row
{
    NSLog(@"Floating action tapped index %tu",row);
    if (row==0)
    {
        AddStudent *obj_AddStudent=[self.storyboard instantiateViewControllerWithIdentifier:@"AddStudent"];
        [self presentViewController:obj_AddStudent animated:YES completion:nil];
    }
    if (row==1)
    {
        AddTutor *obj_AddTutor=[self.storyboard instantiateViewControllerWithIdentifier:@"AddTutor"];
        [self presentViewController:obj_AddTutor animated:YES completion:nil];

    }
    if (row==2) {
        AddBatch *obj_AddBatch=[self.storyboard instantiateViewControllerWithIdentifier:@"AddBatch"];
        [self presentViewController:obj_AddBatch animated:YES completion:nil];
    }
    if (row==3) {
        AddNotice *obj_AddNotice=[self.storyboard instantiateViewControllerWithIdentifier:@"AddNotice"];
        [self presentViewController:obj_AddNotice animated:YES completion:nil];

    }

    if (row==4) {
        AddInquiry *obj_AddInquiry=[self.storyboard instantiateViewControllerWithIdentifier:@"AddInquiry"];
        [self presentViewController:obj_AddInquiry animated:YES completion:nil];

    }
}


+ (FirstViewController *)sharedInstance
{
    if (sharedInstance)
        return sharedInstance;
    
    static dispatch_once_t once;
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"HR" bundle:[NSBundle mainBundle]];
    dispatch_once(&once, ^{
        sharedInstance = [storyboard instantiateViewControllerWithIdentifier:@"firstViewController"];
    });
    return sharedInstance;
}

- (void) setSharedFirstViewController:(FirstViewController *) fc {
    sharedInstance = fc;
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
