//
//  EditPaymentDetail.m
//  VNurture App
//
//  Created by Mehul Panchal on 24/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "EditPaymentDetail.h"
#import "RootViewController.h"

@interface EditPaymentDetail ()

@end

@implementation EditPaymentDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewEditPayement.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewEditPayement addSubview:imageView];
    [_viewEditPayement sendSubviewToBack:imageView];
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



- (IBAction)backEditPayment:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
     //[self popoverPresentationController];
}
@end
