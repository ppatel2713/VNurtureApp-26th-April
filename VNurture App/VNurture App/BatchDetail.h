//
//  BatchDetail.h
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatchDetail : UIViewController<UITextFieldDelegate,NSURLSessionDelegate>
{
    @public
    int id1;
    NSDictionary *json;
    NSArray *my_array;
}


@property (weak, nonatomic) IBOutlet UIBarButtonItem *replyBatchDetails;
- (IBAction)replyBatchDetail:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewBatchDetails;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTechnology;
@property (weak, nonatomic) IBOutlet UITextField *textFieldBatchName;

@end
