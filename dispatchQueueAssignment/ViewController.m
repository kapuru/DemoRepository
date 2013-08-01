//
//  ViewController.m
//  dispatchQueueAssignment
//
//  Created by oodit on 7/16/13.
//  Copyright (c) 2013 oodit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageViewForBall.image = [UIImage imageNamed:@"ball.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonToGo:(id)sender {
    
    dispatch_async(dispatch_queue_create("queueForX", NULL), ^{
        for (int i = 25; i<3200; i++) {
            NSLog(@"X is moving Gitted");
            dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat x = i/10;
            CGPoint newCenterXChanged = CGPointMake(x, self.imageViewForBall.center.y);
            [self.imageViewForBall setCenter:newCenterXChanged];
                });
        }
        
    });
    
    dispatch_async(dispatch_queue_create("queueForY", NULL), ^{
        for (int i = 25; i<3200; i++) {
            NSLog(@"Y is moving Gitted");
            dispatch_async(dispatch_get_main_queue(), ^{
                CGFloat y = i/10;
                CGPoint newCenterYChanged = CGPointMake(self.imageViewForBall.center.x ,y);
                [self.imageViewForBall setCenter:newCenterYChanged];
            });
        }
        
    });
    
    
}

@end
