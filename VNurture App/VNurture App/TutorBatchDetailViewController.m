//
//  TutorBatchDetailViewController.m
//  VNurture App
//
//  Created by Mehul Panchal on 14/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "TutorBatchDetailViewController.h"
#import "TutorBatchListViewController.h"
//static TutorBatchDetailViewController *sharedInstance;

@interface TutorBatchDetailViewController ()

@end

@implementation TutorBatchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewTutorBatchDetail.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewTutorBatchDetail addSubview:imageView];
    [_viewTutorBatchDetail sendSubviewToBack:imageView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//+ (TutorBatchDetailViewController *)sharedInstance
//{
//    if (sharedInstance)
//        return sharedInstance;
//    
//    static dispatch_once_t once;
//    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Tutor" bundle:[NSBundle mainBundle]];
//    dispatch_once(&once, ^{
//        sharedInstance = [storyboard instantiateViewControllerWithIdentifier:@"TutorBatchDetailViewController"];
//    });
//    return sharedInstance;
//}
//
//- (void) setSharedTutorBatchDetailViewController:(TutorBatchDetailViewController *) fc {
//    sharedInstance = fc;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBackPressed:(id)sender {
    
//    TutorBatchListViewController *obj_TutorBatchListViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorBatchListViewController"];
//    
//    [self presentViewController:obj_TutorBatchListViewController animated:YES completion:nil];
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
