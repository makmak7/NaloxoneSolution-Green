//
//  FirstViewController.h
//  Naloxone
//
//  Created by Sampath, Makeshwaran on 11/3/16.
//  Copyright © 2016 Sampath, Makeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DALabeledCircularProgressView.h"

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet DACircularProgressView *largestProgressView;

@property (strong, nonatomic) IBOutlet DALabeledCircularProgressView *labeledLargeProgressView;

@property (strong, nonatomic) IBOutlet DALabeledCircularProgressView *labeledLargeProgressView2;

@property (strong, nonatomic) IBOutlet UILabel *progressLabel;


@end

