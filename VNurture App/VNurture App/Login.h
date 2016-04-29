//
//  Login.h
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Login : UIViewController<UITextFieldDelegate,NSURLConnectionDelegate>
{
    NSURLConnection *clearSession;
    NSMutableData *receivedData;
    NSString *constant;
    NSArray *role,*wsrole,*tutorarray,*studentarray;


    

}

- (IBAction)Login:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *text_Username;
@property (weak, nonatomic) IBOutlet UITextField *text_password;
@property(strong,nonatomic) NSMutableArray *check;
@property(strong,nonatomic) NSMutableArray *check1;
@property(strong,nonatomic) NSMutableArray *status;


- (IBAction)check:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewLogin;
-(void)clearsession;
@end
