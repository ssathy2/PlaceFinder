//
//  DDDViewController.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDViewController.h"
#import "DDDCollectionViewCell.h"
#import "DDDServicesManager.h"
#import "DDDPlaceSearchResult.h"
#import "DDDLocationManager.h"
#import "DDDPlaceLocationResponse.h"

static NSString *kDDDCollectionViewCellIdentifier	= @"DDDCollectionViewCell";
static NSString *kDDDCollectionViewCellNIBName		= @"DDDCollectionViewCell";

@interface DDDViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *results;
@end

@implementation DDDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	UINib *nib = [UINib nibWithNibName:kDDDCollectionViewCellNIBName bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:kDDDCollectionViewCellIdentifier];
	[self registerForLocationNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register for notifications
- (void)registerForLocationNotifications
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationChanged:) name:kLocationManagerLocationChangedNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headingChanged:) name:kLocationManagerHeadingChangedNotification object:nil];
}

#pragma mark - Notifications
- (void)locationChanged:(NSNotification*)notification
{
	CLLocation *cllocation = (CLLocation*)[notification.userInfo valueForKey:kLocationManagerNotificationCurrentLocationKey];
	DDDLocation *location = [[DDDLocation alloc] initWithCLLocation:cllocation];
	
	__block DDDViewController *blockSelf = self;
	[[DDDServicesManager sharedInstance] interestingPlacesNearLocation:location withRadius:@10 withCallback:^(NSArray *results, NSError *error) {
		blockSelf.results = results;
		[blockSelf.collectionView reloadData];
	}];
}

- (void)headingChanged:(NSNotification*)notification
{
	
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.results.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	DDDPlaceSearchResult *res = self.results[indexPath.row];
	DDDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDDDCollectionViewCellIdentifier forIndexPath:indexPath];
	cell.locationNameLabel.text = res.name;
	cell.coordinateLabel.text	= [NSString stringWithFormat:@"%@,%@", res.geometry.lat, res.geometry.lng];
	return cell;
}

#pragma mark - UICollectionViewDelegate

@end
