//
//  BatchListViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 13/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatchListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *my_array;
    UITableViewCell *cell;
    
}

- (IBAction)replyBatchList:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *batch_tbl;

@end
