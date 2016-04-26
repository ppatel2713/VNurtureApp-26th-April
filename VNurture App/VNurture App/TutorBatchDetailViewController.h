//
//  TutorBatchDetailViewController.h
//  VNurture App
//
//  Created by Mehul Panchal on 14/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorBatchDetailViewController : UIViewController
- (IBAction)onBackPressed:(id)sender;
//+ (TutorBatchDetailViewController *)sharedInstance;
//- (void) setSharedTutorBatchDetailViewController:(TutorBatchDetailViewController *) fc;

@property (weak, nonatomic) IBOutlet UIView *viewTutorBatchDetail;

@end
