//
//  DVDViewController.m
//  xWing
//
//  Created by Dvid Silva on 5/9/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDViewController.h"

@interface DVDViewController ()

@end

@implementation DVDViewController

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //creamos un detector de tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    
    //lo aniadimos a la cosa
    [self.view addGestureRecognizer:tap];

}

//estrutctuda de datos llamada cgpoint que nos dice donde toca el user
-(void)onTap: (UITapGestureRecognizer *) tap{
    if(tap.state == UIGestureRecognizerStateRecognized){
        CGPoint location = [tap locationInView:self.space];
        UIViewAnimationOptions options =
        UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState ;
        
        //cambiar la posicion de la vista del xwing para que vaya hacia alla
        //traslacion
        [UIView animateWithDuration:1
                              delay:0
                            options:options
                         animations:^{
                            self.xwing.center = location;
                             
                         }
                         completion: ^(BOOL finished) {
                             //
                         }];
        //rotacion
        [UIView animateWithDuration:0.6
                              delay:0
                            options:options
                         animations:^{
                             //cambio de rotacion
                             self.xwing.transform = CGAffineTransformMakeRotation(M_2_PI);
                             
                         }
                         completion: ^(BOOL finished) {
                             [UIView animateWithDuration:0.4
                                                   delay:0
                                                 options:options
                                              animations: ^{
                                                  self.xwing.transform = CGAffineTransformIdentity;
                                              }
                                              completion:^(BOOL finished){
                                              
                                              }];
                         }];

        
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
