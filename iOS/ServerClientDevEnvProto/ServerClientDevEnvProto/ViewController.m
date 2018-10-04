//
//  ViewController.m
//  ServerClientDevEnvProto
//
//  Created by Mike Laursen on 10/2/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *healthCheckLog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)doHealthCheck:(UIButton *)sender {
    NSString *text = [_healthCheckLog text];
    text = [text stringByAppendingString:@"\nTesting..."];
    [_healthCheckLog setText:text];
}

@end
