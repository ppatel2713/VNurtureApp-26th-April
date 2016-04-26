//
//  FirstViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 29/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "VCFloatingActionButton.h"
@interface FirstViewController : UIViewController<floatMenuDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *my_array;
    UITableViewCell *cell;
}
@property (strong, nonatomic) IBOutlet UIView *obj_view;
//@property(strong,nonatomic)UIStoryboard *storyboard;
+ (FirstViewController *)sharedInstance;
@property (weak, nonatomic) IBOutlet UITableView *homeTable;

- (void) setSharedFirstViewController:(FirstViewController *) fc;
@property (weak, nonatomic) IBOutlet UITextField *textFIleld;


@end
