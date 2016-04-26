//
//  AddTemplate.m
//  VNurture App
//
//  Created by Prachi on 28/03/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "AddTemplate.h"
#import "RootViewController.h"

@interface AddTemplate ()
{
    NSArray *arrTemplate;
    UIPickerView *pickerViewTemplate;
    NSString *selctedTemplate;
    NSString *tempTemplateString;

}
@end

@implementation AddTemplate

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_viewAddTemplate.frame];
    [imageView setImage:[UIImage imageNamed:@"bg.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
     imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_viewAddTemplate addSubview:imageView];
    [_viewAddTemplate sendSubviewToBack:imageView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    arrTemplate = [[NSArray alloc] initWithObjects:@"HR",@"Mangemnet", nil];
    pickerViewTemplate = [[UIPickerView alloc] init];
    pickerViewTemplate.delegate = self;
    pickerViewTemplate.dataSource = self;
    _textFieldTemplate.delegate = self;
    
    UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [doneBar setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem *btn_cancel = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Cancel"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(act_cancel:)];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    [doneBar setItems: [NSArray arrayWithObjects:btn_cancel,flexSpace, [[UIBarButtonItem alloc]
                                                                        initWithTitle:@"Done"
                                                                        style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(act_done:)],nil ] animated:YES];
    _textFieldTemplate.inputView = pickerViewTemplate;
    [_textFieldTemplate setInputAccessoryView:doneBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arrTemplate.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    selctedTemplate = [arrTemplate objectAtIndex:row];
    return selctedTemplate;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    tempTemplateString = [arrTemplate objectAtIndex: row];
    selctedTemplate = tempTemplateString;
}

#pragma marks Actions
-(void)act_cancel:(id)sender
{
    [_textFieldTemplate resignFirstResponder];
}

-(void)act_done:(id)sender
{
    self.textFieldTemplate.text = selctedTemplate;
    [self.textFieldTemplate resignFirstResponder];
}

- (IBAction)backPressed:(id)sender {
    RootViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    

}
@end
