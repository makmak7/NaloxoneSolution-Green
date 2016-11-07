//
//  ModelController.m
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/25/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@interface ModelController ()

@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Create the data model.
        // NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //_pageData = [[dateFormatter monthSymbols] copy];
        _pageData = @[@"Page 1 of 4",@"Page 2 of 4" , @"Page 3 of 4" , @"Page 4 of 4" ];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    //dataViewController.navigationController.navigationBar.hidden="YES";
    dataViewController.dataObject = self.pageData[index];
    // NSLog(@"INdex of page %d",index);
    
    if(index ==0 ){
        dataViewController.dynamicImageStringName=@"welcomeN.png";
    }
    else if(index == 1){
        dataViewController.dynamicImageStringName=@"study_Page2.png";
    }else if(index == 2){
        dataViewController.dynamicImageStringName=@"study_Page3.png";
    }else if (index ==3){
        dataViewController.dynamicImageStringName=@"study_Page4.png";
        
    }
    
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
