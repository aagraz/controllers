//
//  FRRRotatingViewController.h
//  Allows to display two different views while in portrait and landscape moe
//
//  Created by Fernando Rodríguez Romero on 3/24/11.
//  Copyright 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRRViewController.h"

@class FRRRotatingViewController;


@protocol FRRRotatingViewControllerDelegate

-(void) FRRRotatingViewControllerWillSwitchToLandscapeView: (FRRRotatingViewController *) sender;
-(void) FRRRotatingViewControllerWillSwitchToPortraitView: (FRRRotatingViewController *) sender;

@end

@interface FRRRotatingViewController : FRRViewController {
	
}

@property (strong) FRRViewController *landscapeViewController;
@property (strong) FRRViewController *portraitViewController;

@property (unsafe_unretained) id<FRRRotatingViewControllerDelegate> landscapeDelegate;
@property (unsafe_unretained) id<FRRRotatingViewControllerDelegate> portraitDelegate;

-(FRRRotatingViewController *) initWithLandscapeViewController: (FRRViewController *) landscape 
                                     andPortraitViewController: (FRRViewController *) portrait;
-(void) deviceDidRotate: (NSNotification *) aNotification;

@end

