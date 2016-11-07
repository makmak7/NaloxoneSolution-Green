//
//  SurveyViewController.h
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/30/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController{
    
    IBOutlet UIButton *yes1;
    IBOutlet UIButton *no1;
    
    IBOutlet UIButton *yes2;
    IBOutlet UIButton *no2;
    
    IBOutlet UIButton *yes3;
    IBOutlet UIButton *no3;
    
}

-(IBAction) firstSetOfButtonClicked:(UIButton * )button;
-(IBAction) secondSetOfButtonClicked:(UIButton * )button;
-(IBAction) thirdSetOfButtonClicked:(UIButton * )button;

@end
