//
//  DataViewController.m
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/25/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import "DataViewController.h"


@interface DataViewController ()

@end



@implementation DataViewController
@synthesize dynamicImageStringName;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImage *toImage = [UIImage imageNamed:dynamicImageStringName];
    self.imageView.image= toImage;
    
    if([dynamicImageStringName isEqualToString:@"study_Page4.png"]){
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(respondToTapGesture:)];
        
        // Specify that the gesture must be a single tap
        tapRecognizer.numberOfTapsRequired = 1;
        [self.view addGestureRecognizer:tapRecognizer];
        
        NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"timney" withExtension:@"mp4"];
        
        // create an AVPlayer
        player = [AVPlayer playerWithURL:videoURL];
        
        // create a player view controller
        playerController = [[AVPlayerViewController alloc]init];
        playerController.player = player;
       
        
     
        
        /*NSBundle *bundle = [NSBundle mainBundle];
        NSString *moviePath = [bundle pathForResource:@"timney" ofType:@"mp4"];
        NSURL *movieURL = [NSURL fileURLWithPath:moviePath] ;
        
        theMoviPlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
        theMoviPlayer.controlStyle = MPMovieControlStyleEmbedded;
        
        CGRect newFrame =self.imageView.frame;
        newFrame.origin.y = newFrame.origin.y -38;
        //newFrame.size.height =newFrame.size.height -4;
        
        [theMoviPlayer.view setFrame:newFrame];
        
         */
        
        
    }
    
    
    
    
}
-(void)respondToTapGesture:(UIGestureRecognizer *)gr{
    NSLog(@"This is the imput from screen 4");
    
   // [self.imageView addSubview:theMoviPlayer.view];
   // [theMoviPlayer play];
    // show the view controller
    [self addChildViewController:playerController];
    [self.view addSubview:playerController.view];
    
    CGRect newFrame =self.imageView.frame;
    //newFrame.origin.y = newFrame.origin.y -38;
    
    playerController.view.frame = newFrame;
    
     [player play];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    if([dynamicImageStringName isEqualToString:@"study_Page4.png"]){
     //   [theMoviPlayer stop];
      //  [theMoviPlayer.view removeFromSuperview];
        [player pause];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    // self.image =
}




@end
