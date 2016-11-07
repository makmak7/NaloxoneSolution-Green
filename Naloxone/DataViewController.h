//
//  DataViewController.h
//  ResearchKit
//
//  Created by Sampath, Makeshwaran on 3/25/15.
//  Copyright (c) 2015 Sampath, Makeshwaran. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;
@import AVKit;

//#import <MediaPlayer/MediaPlayer.h>

@interface DataViewController : UIViewController{
    
    // NSString *dynamicImageStringName;
    //MPMoviePlayerController *theMoviPlayer;
    AVPlayerViewController *playerController;
    AVPlayer *player;
    
}

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSString *dynamicImageStringName;


@end

