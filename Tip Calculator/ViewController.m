//
//  ViewController.m
//  Tip Calculator
//
//  Created by Yanfeng Ma on 9/12/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "ViewController.h"
#import "UserStore.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmout;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    _rateSegmentedControl.selectedSegmentIndex = [[UserStore sharedUserStore] getIdx];
    [self upateValue];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (IBAction)EditingChanged:(id)sender {
    [self upateValue];
}

- (IBAction)rateControlValueChanged:(id)sender {
    [[UserStore sharedUserStore] saveRate:_rateSegmentedControl.selectedSegmentIndex];
    [self upateValue];
}

- (void) upateValue {
    float rate = [[UserStore sharedUserStore] getRate];
    float bill = [_billTextField.text floatValue];
    _tipAmout.text = [NSString stringWithFormat:@"$%0.2f", bill*rate];
    _total.text = [NSString stringWithFormat:@"$%0.2f", bill*(rate + 1.0)];
}
@end
