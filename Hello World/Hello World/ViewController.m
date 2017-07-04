//
//  ViewController.m
//  Hello World
//
//  Created by intern on 04/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClick:(id)sender {
    NSString* str;
    str = _edit_Text.text;
    if([str length] != 0){
        NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", str];
        self.text_View.text = greeting;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
