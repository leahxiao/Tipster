//
//  SettingsViewController.m
//  Tipster
//
//  Created by Leah Xiao on 6/26/18.
//  Copyright © 2018 Leah Xiao. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *currencySym;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (IBAction)editCurrSym:(id)sender {
    NSString *currSym = self.currencySym.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
    [defaults setValue:currSym forKey:@"getSym"]; //uploads
    [defaults synchronize]; // saves
}

@end
