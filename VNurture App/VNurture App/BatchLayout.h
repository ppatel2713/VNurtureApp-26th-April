//
//  BatchLayout.h
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatchLayout : UIViewController<UITableViewDelegate,UITableViewDataSource,NSURLSessionDelegate>

{
    
    NSMutableArray *my_array;
    UITableViewCell *cell;
    NSDictionary *json;
    
}
@property (weak, nonatomic) IBOutlet UITableView *batch_table;

@end
