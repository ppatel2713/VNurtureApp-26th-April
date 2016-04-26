//
//  FeedbackDetail.m
//  VNurture App
//
//  Created by Prachi on 15/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "FeedbackDetail.h"

@interface FeedbackDetail ()

@end

@implementation FeedbackDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewFeedbackDetail.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [_viewFeedbackDetail addSubview:imageView];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewFeedbackDetail sendSubviewToBack:imageView];
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

- (IBAction)replyFeedbackDetail:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
