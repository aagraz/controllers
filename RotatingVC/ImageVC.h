//
//  ImageVC.h
//  RotatingVC
//
//  Created by Fernando Rodríguez Romero on 11/9/11.
//  Copyright (c) 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRRViewController.h"

@interface ImageVC : FRRViewController
@property (strong) IBOutlet UIImageView *canvas;
@property (strong) UIImage *image;

-(id) initWithImage: (UIImage *) anImage;

@end
