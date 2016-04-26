//
//  TempPage.m
//  VNurture App
//
//  Created by Prachi on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "TempPage.h"
#import "FirstViewController.h"
#import "UIViewController+RESideMenu.h"
#import "BatchDetail.h"
#import "AddTemplate.h"
#import "AddInquiry.h"
#import "AddTutor.h"
#import "AddStudent.h"
#import "AddBatch.h"
#import "AddNotice.h"
#import "EditPaymentDetail.h"
#import "EditStudentDetail.h"



@interface TempPage ()
@property(nonatomic,strong) NSArray *titles;

@end

@implementation TempPage

@synthesize tableView1;
@synthesize titles;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    titles = @[@"Home",@"Student Details",@"Tutor Details",@"Batch Details",@"Inquiry Details",@"Feedback Details",@"Notice Detail",@"Logout"];

    tableView1=[[UITableView alloc]initWithFrame:CGRectMake(30, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
    tableView1.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    tableView1.backgroundColor = [UIColor clearColor];
    tableView1.backgroundView = nil;
    tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView1.bounces = NO;
    tableView1.scrollsToTop = NO;
    tableView1.backgroundColor=[UIColor clearColor ];
    [self.view addSubview:tableView1];
    tableView1.dataSource=self;
    tableView1.delegate=self;
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView1 deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[FirstViewController sharedInstance]]];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 1:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"StudentLayout"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"TutorLayout"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"BatchLayout"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 4:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"InquiryLayout"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
       case 5:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"HRFeedbackLayout"]] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 6:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"NoticeLayout"]] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}

#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*static NSString *cellIdentifier = @"Cell";
     
     UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:cellIdentifier];
     
     if (cell == nil) {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
     cell.backgroundColor = [UIColor clearColor];
     cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
     cell.textLabel.textColor = [UIColor whiteColor];
     cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
     cell.selectedBackgroundView = [[UIView alloc] init];
     }
     
     //NSArray *images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
     cell.textLabel.text = titles[indexPath.row];
     // cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
     
     return cell;*/
    static NSString *cell=@"cell";
    
    UITableViewCell *str2=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    str2.backgroundColor=[UIColor clearColor];
    str2.textLabel.font=[UIFont fontWithName:@"Noteworthy" size:21];
    str2.textLabel.textColor=[UIColor whiteColor];
    str2.textLabel.highlightedTextColor=[UIColor whiteColor];
    str2.textLabel.text=titles[indexPath.row];
    str2.selectedBackgroundView=[[UIView alloc]init];
    return str2;
    
}

@end
