//
//  FRRAppDelegate.h
//  RotatingVC
//
//  Created by Fernando Rodríguez Romero on 11/9/11.
//  Copyright (c) 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FRRRotatingViewController;

@interface FRRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong) FRRRotatingViewController *rootVC;

@end
