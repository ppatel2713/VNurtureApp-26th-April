//
//  PaymentDetails.m
//  VNurture App
//
//  Created by Prachi on 22/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "PaymentDetails.h"

@interface PaymentDetails ()

@end

@implementation PaymentDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewPaymentDetails.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewPaymentDetails addSubview:imageView];
    [_viewPaymentDetails sendSubviewToBack:imageView];

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

@end
