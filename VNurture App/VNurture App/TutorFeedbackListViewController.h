//
//  TutorFeedbackListViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 14/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorFeedbackListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *my_array;
    UITableViewCell *cell;

}


@property (weak, nonatomic) IBOutlet UITableView *tbl_FeedbackList;

@end
