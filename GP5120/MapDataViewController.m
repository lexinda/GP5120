//
//  MapDataViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14-9-14.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MapDataViewController.h"

@interface MapDataViewController ()

@end

@implementation MapDataViewController

@synthesize _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIImage *backImage = [UIImage imageNamed:@"releasesuccess_return"];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.frame = CGRectMake(0.0, 0.0, 42.0, 25.0);
        
        [leftButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setBackgroundImage:backImage forState:UIControlStateNormal];
        
        UIBarButtonItem *leftBarButonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButonItem;
    }
    return self;
}

-(void)loadView{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    [mainView setBackgroundColor:[UIColor whiteColor]];
    
    self.view = mainView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:_mapView];
    
    // Do any additional setup after loading the view.
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
