//
//  TutorLayout.h
//  VNurture App
//
//  Created by Prachi on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorLayout : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *my_array;
    UITableViewCell *cell;
}
@property (weak, nonatomic) IBOutlet UITableView *tutor_table;

@end
