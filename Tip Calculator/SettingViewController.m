//
//  SettingViewController.m
//  Tip Calculator
//
//  Created by Yanfeng Ma on 9/12/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "SettingViewController.h"
#import "UserStore.h"

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmentedControl;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    _rateSegmentedControl.selectedSegmentIndex = [[UserStore sharedUserStore] getIdx];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rateControlValueChanged:(id)sender {
    [[UserStore sharedUserStore] saveRate:_rateSegmentedControl.selectedSegmentIndex];
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
