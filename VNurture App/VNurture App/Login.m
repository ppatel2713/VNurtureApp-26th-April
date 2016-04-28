//
//  Login.m
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "Login.h"
#import "RootViewController.h"
#import "FirstViewController.h"
#import "StudentRootViewController.h"
#import "MenuListViewController.h"
#import "TutorRootViewController.h"
#import "TutorMenuListViewController.h"

@interface Login ()


@end

@implementation Login
@synthesize check;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Image_View:_viewLogin];
    constant=@"1";
    NSLog(@"constant%@",constant);
    check=@"";
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Image_View:(UIView *)view_obj
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:view_obj.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view_obj addSubview:imageView];
    [view_obj sendSubviewToBack:imageView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Login:(id)sender {
    
    [self clearsession];
    
    
    //NSLog(@"checked%hhd",[check isEqualToString:@"1"]);
    if ([self.text_Username.text isEqual:@"Karan"] || [self.text_password.text isEqual:@"Karan"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
        
        StudentRootViewController *sr1=[storyboard instantiateViewControllerWithIdentifier:@"StudentRootViewController"];
        [self presentViewController:sr1 animated:YES completion:nil];
        

    }
    else if([check isEqual:@"1"])
    {

        RootViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    else if ([self.text_Username.text isEqual:@"Vihas"] || [self.text_password.text isEqual:@"Vihas"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Tutor" bundle:nil];
        
        TutorRootViewController *tr1=[storyboard instantiateViewControllerWithIdentifier:@"TutorRootViewController"];
        [self presentViewController:tr1 animated:YES completion:nil];
        
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Invalide Username or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
        [alert show];

}
}

-(void)clearsession
    {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:@"http://rapidans.esy.es/finalvnurture/userfetch.php"]];
        NSArray *data=[NSArray arrayWithObjects:_text_Username.text,_text_password.text,nil];
        NSArray *key=[NSArray arrayWithObjects:@"email",@"password", nil];
        
        NSDictionary *loginData=[NSDictionary dictionaryWithObjects:data forKeys:key];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:loginData options:0 error:0];
        [request setHTTPMethod: @"POST"];
        
        [request setHTTPBody: postData];
        clearSession = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (clearSession) {
            NSLog(@"data sent ");
        } else
        {
            NSLog(@"Not sent");
        }
        
        [clearSession start];
        
        
    }
    
-(void)connection:(NSConnection*)conn didReceiveResponse:(NSURLResponse *)response
    {
        if (receivedData == NULL)
        {
            receivedData = [[NSMutableData alloc] init];
        }
        [receivedData setLength:0];
    }
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
    {
        [receivedData appendData:data];
    }
    
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
    {
        NSLog(@"Connection failed! Error - %@ %@",
              [error localizedDescription],
              [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
        
        UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [customAlert show];
        
        
    }
    
    - (void)connectionDidFinishLoading:(NSURLConnection *)connection
    {
        
        if (connection==clearSession)
        {
            
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:receivedData options: kNilOptions error:nil];
            NSString *tmp=[[NSString alloc]initWithData:receivedData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", tmp);
            NSLog(@"  parsing JSON of add checkout: %@", jsonDict);
            NSLog(@"Result%@",[jsonDict valueForKeyPath:@"result.result"]);
            check=[jsonDict valueForKeyPath:@"result.result"];
            NSLog(@"%@",check);
            int a=[check intValue];
            NSLog(@"Integer value%d",a);
            if ([check isEqual:@"1"] ) {
                NSLog(@"Prachi");
            }
    
            
        }
    }
- (IBAction)check:(id)sender {
    
    
    
    
}
@end
