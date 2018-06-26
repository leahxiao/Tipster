//
//  ViewController.m
//  Tipster
//
//  Created by Leah Xiao on 6/26/18.
//  Copyright © 2018 Leah Xiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender { // {return type} name: (type)parameter
    NSLog(@"hello"); // sys.out.println
    [self.view endEditing:YES]; // call function
}


- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue]; // this is the place where you et the value from the textfield
    NSArray *percentages =  @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue]; //the inside part because its an NS number object and you only want the primitive value.
    double tip = tipPercentage* bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip]; // this is you inputing your own thing. the 2f is for 2 dec places, f is for float value
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
        self.tipLabel.alpha = 0;  //makes invisible
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -=30;
    [UIView animateWithDuration:0.2 animations:^{ // obv the higher the duration number, the longer it takes to finish animation
        self.billField.frame= newFrame;
        
       self.tipLabel.alpha = 1;  //makes visible
    }];
}


@end
