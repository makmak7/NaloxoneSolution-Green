//
//  ModelController.h
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/25/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

