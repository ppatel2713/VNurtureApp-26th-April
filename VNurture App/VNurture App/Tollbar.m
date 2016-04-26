//
//  Tollbar.m
//  VNurture App
//
//  Created by Prachi on 07/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "Tollbar.h"

@implementation Tollbar

-(void)awakeFromNib
{
    [self setBarTintColor :[UIColor colorWithRed:63.0/255.0 green:81.0/255.0 blue:181.0/255.0 alpha:1.0]];
  // UIBarButtonItem *back_button = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
//    [ back_button setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        [UIFont fontWithName:@"Noteworthy" size:18.0], NSFontAttributeName,
//                                        [UIColor whiteColor], NSForegroundColorAttributeName,[UIColor whiteColor],NSBackgroundColorAttributeName,
//                                        nil]
//                              forState:UIControlStateNormal];
   // self.items = [NSArray arrayWithObjects:back_button, nil];
}

@end
