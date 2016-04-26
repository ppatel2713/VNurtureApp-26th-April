//
//  HomeViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *my_array;
    UITableViewCell *cell;
}
@property (weak, nonatomic) IBOutlet UITableView *tableStudentHome;

@end
