//
//  FeedbackLayout.m
//  VNurture App
//
//  Created by Prachi on 25/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "FeedbackLayout.h"
//#import "FeedbackDetail_Layout.h"
@interface FeedbackLayout ()
@property(nonatomic,strong) NSArray *array1;
@property(nonatomic,strong) NSArray *sectionArray;
@property(nonatomic,strong) NSDictionary *sectionRowList;

@end

@implementation FeedbackLayout
static NSString *CellIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=TRUE;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    //[self assignTableView];
    
    
    //Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)assignTableView
{
    //self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell=@"cell";
    
    UITableViewCell *str2=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    str2.textLabel.text=@"HELLO";
    return str2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.obj_FeedbackDetail_Layout  = [self.storyboard instantiateViewControllerWithIdentifier:@"FeedbackDetail_Layout"];
    
    [self presentViewController:self.obj_FeedbackDetail_Layout animated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

@end
