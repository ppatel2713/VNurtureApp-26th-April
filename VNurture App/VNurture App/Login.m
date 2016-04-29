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
@synthesize check,check1,status;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Image_View:_viewLogin];
    constant=@"1";
    NSLog(@"constant%@",constant);
    role=[[NSArray alloc]initWithObjects:@"1",@"3",@"4", nil];
    check1=[[NSMutableArray alloc]initWithObjects:@"1", nil];
    tutorarray=[[NSMutableArray alloc]initWithObjects:@"3", nil];
    studentarray=[[NSMutableArray alloc]initWithObjects:@"4", nil];


    NSLog(@"Check1%@",check1);
    
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
            status=[jsonDict valueForKeyPath:@"login.status"];
            NSLog(@"status%@",status);
            wsrole=[jsonDict valueForKeyPath:@"login.roleid"];
            NSLog(@"Role%@",wsrole);

            NSNumber *number=[NSNumber numberWithInt:1];
            int i=0;
            

            if([check objectAtIndex:i]==number)
            {
                if ([status isEqualToArray:check1])
                {
                    if ([wsrole isEqualToArray:check1]) {
                        RootViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
                        
                        [self presentViewController:vc animated:YES completion:nil];

                    }
                    else if ([wsrole isEqualToArray:tutorarray])
                    {
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Tutor" bundle:nil];
                        
                        TutorRootViewController *tr1=[storyboard instantiateViewControllerWithIdentifier:@"TutorRootViewController"];
                        [self presentViewController:tr1 animated:YES completion:nil];
                        
                    }
                    else if ([wsrole isEqualToArray:studentarray])
                    {
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
                        
                        StudentRootViewController *sr1=[storyboard instantiateViewControllerWithIdentifier:@"StudentRootViewController"];
                        [self presentViewController:sr1 animated:YES completion:nil];
                        
                    }
                    else{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Invalide Username or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
                        [alert show];
                    }
                    

                }
            }
        }
            

    }
    
- (IBAction)check:(id)sender {
    
    
    
    
}
@end
