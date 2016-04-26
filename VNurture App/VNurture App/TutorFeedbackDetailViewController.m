//
//  TutorFeedbackDetailViewController.m
//  VNurture App
//
//  Created by Mehul Panchal on 14/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "TutorFeedbackDetailViewController.h"

@interface TutorFeedbackDetailViewController ()

@end

@implementation TutorFeedbackDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewTutorFeedbackDetail.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewTutorFeedbackDetail addSubview:imageView];
    [_viewTutorFeedbackDetail sendSubviewToBack:imageView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)replyTutorFeedbackDetails:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
