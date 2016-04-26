//
//  TutorBatchListViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 14/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorBatchListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *my_array;
    UITableViewCell *cell;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tbl_tutorBatchList;

@end
