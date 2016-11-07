//
//  ThirdViewController.m
//  Naloxone
//
//  Created by Sampath, Makeshwaran on 11/3/16.
//  Copyright © 2016 Sampath, Makeshwaran. All rights reserved.
//

#import "ThirdViewController.h"
#import "DALabeledCircularProgressView.h"

@interface ThirdViewController ()
@property (strong, nonatomic) NSTimer *timer;

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UIButton *pulse;
@property (strong, nonatomic) IBOutlet DALabeledCircularProgressView *labeledLargeProgressView;

@property (nonatomic, weak) IBOutlet UIImageView *drone;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end

@implementation ThirdViewController
@synthesize timer = _timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate =self;
    self.mapView.showsUserLocation = YES;
    // Do any additional setup after loading the view.
    
    self.labeledLargeProgressView.roundedCorners = NO;
    self.labeledLargeProgressView.trackTintColor = [UIColor grayColor];
    self.labeledLargeProgressView.progressTintColor = [UIColor orangeColor];
    
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

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 41.2307;
    zoomLocation.longitude= -73.0640;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 30000, 30000);
    
    // 3
    [self.mapView setRegion:viewRegion animated:YES];
    
    
    CABasicAnimation *theAnimation;
    
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=1.0;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.pulse.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
    
    self.mapView.showsUserLocation = YES;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(41.2307, -73.0640);
    point.title = @"Opioid OverDose";
    point.subtitle = @"Need Help 5.3 Miles Away";
    
    
    
    [self.mapView addAnnotation:point];
    
    CGRect initialFrame = self.drone.frame;
    
    
    // Displace the label so it's hidden outside of the screen before animation starts.
    CGRect displacedFrame = initialFrame;
    displacedFrame.origin.x = 50;
    displacedFrame.origin.y = 450;
    // self.drone.frame = displacedFrame;
    
    // Restore label's initial position during animation.
    [UIView animateWithDuration:4 animations:^{
        self.drone.frame = displacedFrame;
    }];
    
    
}

- (void)stopAnimation
{
    [self.timer invalidate];
    self.timer = nil;
    self.labeledLargeProgressView.progressTintColor = [UIColor greenColor];
    
}
- (void)progressChange
{

    
    
    // Labeled progress views
    NSArray *labeledProgressViews = @[
                                      self.labeledLargeProgressView];
    for (DALabeledCircularProgressView *labeledProgressView in labeledProgressViews) {
        CGFloat progress =  labeledProgressView.progress + 0.01f;
        [labeledProgressView setProgress:progress animated:YES];
        
        /* if (labeledProgressView.progress >= 1.0f && [self.timer isValid]) {
         [labeledProgressView setProgress:0.f animated:YES];
         }
         */
        
        
        //   labeledProgressView.progressLabel.text = [NSString stringWithFormat:@"%.2f", labeledProgressView.progress];
        
        int value =0;
      
        
        value = labeledProgressView.progress * 60;
        value = value -60;
        value = abs(value);
        labeledProgressView.progressLabel.text = [NSString stringWithFormat:@"%d",value ];
        
        if(progress > 25){
            [self stopAnimation];
        }
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
