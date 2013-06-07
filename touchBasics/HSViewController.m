//
//  HSViewController.m
//  touchBasics
//
//  Created by Matt Blackmon on 05/27/13.
//  Copyright (c) 2013 Matt Blackmon. All rights reserved.
//

#import "HSViewController.h"
#import "TouchTracer.h"

@interface HSViewController ()

@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) TouchTracer *tracer;
@end

@implementation HSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TouchTracer* tracer = [[TouchTracer alloc] initWithFrame:(CGRect){50,50, 250, 400}];
    [self.view addSubview:tracer];
    self.tracer  = tracer;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Toggle" forState:UIControlStateNormal];
    [button setFrame:(CGRect){8,8,200, 44}];
    [button addTarget:self action:@selector(toggleActions) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
    
    [self.tracer addTarget:self action:@selector(thingsChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)thingsChanged {
//    NSLog(@"%s", sel_getName(_cmd));
}

- (void)toggleActions {
    [self.tracer toggleWorks];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end