//
//  ItunesRecordCell.h
//  Tutorial4May17
//
//  Created by Nik on 30.06.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItunesRecordCell : UITableViewCell

@property (strong,nonatomic) UILabel * trackName;
@property (strong,nonatomic) UILabel * albumName;
@property (strong,nonatomic) UILabel * artistName;
@property (strong,nonatomic) UIImageView * albumView;
@property (strong,nonatomic) UILabel *trackPrice;

+ (CGFloat)heightForCell;

@end
