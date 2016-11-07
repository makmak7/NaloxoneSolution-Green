//
//  SecondViewController.m
//  Naloxone
//
//  Created by Sampath, Makeshwaran on 11/3/16.
//  Copyright © 2016 Sampath, Makeshwaran. All rights reserved.
//

#import "SecondViewController.h"

#define METERS_PER_MILE 1609.344

@interface SecondViewController () <CLLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UIButton *pulse;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end

@implementation SecondViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  //  self.locationManager = [[CLLocationManager alloc] init];
   // self.locationManager.delegate = self;
    
    // Gets user permission use location while the app is in the foreground.
  //  [self.locationManager requestWhenInUseAuthorization];
    
    self.mapView.delegate =self;
     self.mapView.showsUserLocation = YES;
    
 //   self.locationManager = [[CLLocationManager alloc] init];
  //  self.locationManager.delegate = self;
    
    // Gets user permission use location while the app is in the foreground.
  //  [self.locationManager requestWhenInUseAuthorization];
    
   // self.geocoder = [[CLGeocoder alloc] init];
    
  //  self.geocoder = [[CLGeocoder alloc] init];
    

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
    
  
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
