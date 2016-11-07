//
//  RootViewController.h
//  Naloxone
//
//  Created by Sampath, Makeshwaran on 11/3/16.
//  Copyright © 2016 Sampath, Makeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>{
    
    IBOutlet UIButton *joinStudy;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;



@end
