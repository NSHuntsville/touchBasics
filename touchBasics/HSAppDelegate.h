//
//  HSAppDelegate.h
//  touchBasics
//
//  Created by Matt Blackmon on 05/27/13.
//  Copyright (c) 2013 Matt Blackmon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSViewController;

@interface HSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HSViewController *viewController;

@end