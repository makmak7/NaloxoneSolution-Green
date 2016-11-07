//
//  SurveyViewController.m
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/30/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import "SurveyViewController.h"

@interface SurveyViewController ()

@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  self.navigationController.navigationBar.hidden = NO;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    // Do any additional setup after loading the view.
    
    yes1.tag =1;
    no1.tag = 10;
    
    yes2.tag=2;
    no2.tag=20;
    
    yes3.tag=3;
    no3.tag=30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) firstSetOfButtonClicked:(UIButton * )button{
    
    if(button.tag ==1){
        
        [yes1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [no1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }else{
        
        [no1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [yes1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }
    
    
    
}
-(IBAction) secondSetOfButtonClicked:(UIButton * )button{
    
    if(button.tag ==2){
        
        [yes2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [no2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }else{
        
        [no2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [yes2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }
    
}
-(IBAction) thirdSetOfButtonClicked:(UIButton * )button{
    
    if(button.tag ==3){
        
        [yes3 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [no3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }else{
        
        [no3 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal ];
        [yes3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        
    }
    
}

#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    self.navigationController.navigationBar.hidden = NO;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
