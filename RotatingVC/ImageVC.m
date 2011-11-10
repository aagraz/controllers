//
//  ImageVC.m
//  RotatingVC
//
//  Created by Fernando Rodríguez Romero on 11/9/11.
//  Copyright (c) 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import "ImageVC.h"

@implementation ImageVC

@synthesize canvas, image;

-(id) initWithImage: (UIImage *) anImage{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        self.image = anImage;
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.canvas.image = self.image;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
