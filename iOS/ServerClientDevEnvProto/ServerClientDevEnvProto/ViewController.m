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
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/health"];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        long statusCode = [httpResponse statusCode];
        NSString *logLine = [NSString stringWithFormat:@"\nStatus code: %ld", statusCode];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *text = [self->_healthCheckLog text];
            text = [text stringByAppendingString:logLine];
            [self->_healthCheckLog setText:text];
        });
    }];
    [task resume];
}

@end
