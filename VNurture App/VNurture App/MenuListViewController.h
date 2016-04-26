//
//  MenuListViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface MenuListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>
@property (strong, readwrite, nonatomic) UITableView *tableView1;


@end
