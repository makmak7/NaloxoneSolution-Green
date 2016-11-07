//
//  FirstViewController.m
//  Naloxone
//
//  Created by Sampath, Makeshwaran on 11/3/16.
//  Copyright © 2016 Sampath, Makeshwaran. All rights reserved.
//

#import "FirstViewController.h"
#import "DALabeledCircularProgressView.h"

@interface FirstViewController ()
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation FirstViewController

@synthesize timer = _timer;
@synthesize largestProgressView = _largestProgressView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.largestProgressView.trackTintColor = [UIColor redColor];
    self.largestProgressView.progressTintColor = [UIColor greenColor];
    self.largestProgressView.thicknessRatio = 1.0f;
    self.largestProgressView.clockwiseProgress = YES;
   // [self.view addSubview:self.largestProgressView];
    
    self.labeledLargeProgressView.roundedCorners = NO;
    self.labeledLargeProgressView.trackTintColor = [UIColor grayColor];
    self.labeledLargeProgressView.progressTintColor = [UIColor purpleColor];
 //   [self.view addSubview:self.labeledLargeProgressView];
    
    
    
    self.labeledLargeProgressView2.roundedCorners = NO;
    self.labeledLargeProgressView2.trackTintColor = [UIColor grayColor];
    self.labeledLargeProgressView2.progressTintColor = [UIColor purpleColor];
    
    [self startAnimation];
}

- (void)startAnimation
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03
                                                  target:self
                                                selector:@selector(progressChange)
                                                userInfo:nil
                                                 repeats:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //...      ^^^

}

- (void)stopAnimation
{
    [self.timer invalidate];
    self.timer = nil;
    
}
- (void)progressChange
{
    NSArray *progressViews = @[self.largestProgressView];
    for (DACircularProgressView *progressView in progressViews) {
        CGFloat progress = progressView.progress + 0.10f;
        [progressView setProgress:progress animated:YES];
        
    /*   if(progress > 1){
            [self stopAnimation];
        }
     */
     
     
        
     /*  if (progressView.progress >= 1.0f && [self.timer isValid]) {
            [progressView setProgress:0.f animated:YES];
        }
      */
    
        int value = progressView.progress *21;
        self.progressLabel.text = [NSString stringWithFormat:@"%d", value];
    }
   
    
    // Labeled progress views
    NSArray *labeledProgressViews = @[
                                      self.labeledLargeProgressView,self.labeledLargeProgressView2];
    for (DALabeledCircularProgressView *labeledProgressView in labeledProgressViews) {
        CGFloat progress =  labeledProgressView.progress + 0.01f;
        [labeledProgressView setProgress:progress animated:YES];
        
       /* if (labeledProgressView.progress >= 1.0f && [self.timer isValid]) {
            [labeledProgressView setProgress:0.f animated:YES];
        }
        */
    
        
     //   labeledProgressView.progressLabel.text = [NSString stringWithFormat:@"%.2f", labeledProgressView.progress];
        
        int value =0;
        if([labeledProgressView isEqual:self.labeledLargeProgressView2]){
            value = labeledProgressView.progress * 2100;
        }else{
                value = labeledProgressView.progress * 5687;
        }
        
        
           labeledProgressView.progressLabel.text = [NSString stringWithFormat:@"%d",value ];
        
           if(progress > 50){
         [self stopAnimation];
         }
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
