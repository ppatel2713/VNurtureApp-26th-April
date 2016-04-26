//
//  NoticeDetailViewController.m
//  VNurture App
//
//  Created by Mehul Panchal on 13/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "NoticeDetailViewController.h"

@interface NoticeDetailViewController ()

@end

@implementation NoticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewNoticeDetails.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewNoticeDetails addSubview:imageView];
    [_viewNoticeDetails sendSubviewToBack:imageView];
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

- (IBAction)reluNoticeDetail:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
