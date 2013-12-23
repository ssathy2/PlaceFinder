//
//  DDDCollectionViewCell.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDDCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordinateLabel;

@end
