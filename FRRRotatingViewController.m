    //
//  FRRRotatingViewController.m
//  Rotator
//
//  Created by Fernando Rodríguez Romero on 3/24/11.
//  Copyright 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import "FRRRotatingViewController.h"


@implementation FRRRotatingViewController

#pragma mark -
#pragma mark properties
@synthesize landscapeViewController, portraitViewController, landscapeDelegate, portraitDelegate;

#pragma mark -
#pragma mark private
-(void) removeViews{
	[self.landscapeViewController.view removeFromSuperview];
	[self.portraitViewController.view removeFromSuperview];
}

-(void) displayView: (UIView *)aView{
	[self removeViews];
    [self.view addSubview: aView];
    aView.frame = self.view.bounds;


}

#pragma mark -
#pragma mark notifiactions

-(void) deviceDidRotate: (NSNotification *) aNotification{
	
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	
	
	if ((orientation == UIDeviceOrientationPortrait) ||
		(orientation == UIDeviceOrientationPortraitUpsideDown)) {
        [self.landscapeDelegate FRRRotatingViewControllerWillSwitchToPortraitView:self];
        [self.portraitDelegate FRRRotatingViewControllerWillSwitchToPortraitView:self];
        
        [self displayView:self.portraitViewController.view];
        
	}else if ((orientation == UIDeviceOrientationLandscapeLeft) ||
			   (orientation == UIDeviceOrientationLandscapeRight)) {
        
        [self.landscapeDelegate FRRRotatingViewControllerWillSwitchToLandscapeView:self];
        [self.portraitDelegate FRRRotatingViewControllerWillSwitchToLandscapeView:self];
        
		[self displayView:self.landscapeViewController.view];
	}
	
}

#pragma mark -
#pragma mark initialization
// Designated Initializer
-(FRRRotatingViewController *) initWithLandscapeViewController: (FRRViewController *) landscape 
                                     andPortraitViewController: (FRRViewController *) portrait{
	self = [super init];
	if (self) {
		self.landscapeViewController = landscape;
        self.landscapeViewController.rotatingViewController = self;
        
        if ([self.landscapeViewController conformsToProtocol:@protocol(FRRRotatingViewControllerDelegate)]) {
            [self performSelector:@selector(setLandscapeDelegate:) withObject:self.landscapeViewController];
        }
        
        
		self.portraitViewController = portrait;
        self.portraitViewController.rotatingViewController = self;
        
        if ([self.portraitViewController conformsToProtocol:@protocol(FRRRotatingViewControllerDelegate)]) {
            [self performSelector:@selector(setLandscapeDelegate:) withObject:self.portraitViewController];
        }
	}
	
	return self;
}

#pragma mark -
#pragma mark UIViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

-(void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	UIDevice *device = [UIDevice currentDevice];
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	
	[nc addObserver:self selector:@selector(deviceDidRotate:) name:UIDeviceOrientationDidChangeNotification object:device];
	[device beginGeneratingDeviceOrientationNotifications];
}

-(void) viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark memory management
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



@end
