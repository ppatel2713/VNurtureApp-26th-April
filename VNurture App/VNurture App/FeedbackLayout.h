//
//  FeedbackLayout.h
//  VNurture App
//
//  Created by Prachi on 25/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedbackDetail_Layout.h"

@interface FeedbackLayout : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) FeedbackDetail_Layout *obj_FeedbackDetail_Layout;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
