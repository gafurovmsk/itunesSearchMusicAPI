//
//  ItunesRecordCell.m
//  Tutorial4May17
//
//  Created by Nik on 30.06.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ItunesRecordCell.h"
#import "QuartzCore/CALayer.h"
@import Masonry;

static CGFloat const cellHeight = 93;

@implementation ItunesRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if(self) {
    _trackName = [UILabel new];
    _albumName = [UILabel new];
    _albumName.textColor = [UIColor darkGrayColor];
    [_albumName setFont: [UIFont italicSystemFontOfSize:13]];
    _artistName = [UILabel new];
    _artistName.textColor = [UIColor darkGrayColor];
    _albumView = [UIImageView new];
    _trackPrice = [UILabel new];
    
    [self addSubview:self.trackName];
    [self addSubview:self.albumName];
    [self addSubview:self.artistName];
    [self addSubview:self.albumView];
    [self addSubview:self.trackPrice];
    
    [self makeConstraints];
  }
  return  self;
}

- (void)makeConstraints {
  
  [self.albumView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.left.equalTo(self).with.offset(4);
    make.bottom.equalTo(self).with.offset(-4);
    make.height.width.equalTo(@85);
  }];
  
  [self.trackName mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.albumView.mas_right).with.offset(8);
    make.top.equalTo(self).with.offset(8);
  }];
  
  [self.albumName mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.albumView.mas_right).with.offset(8);
    make.top.equalTo(self.trackName.mas_bottom).with.offset(8);
  }];
  
  [self.artistName mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.albumName.mas_bottom).with.offset(8);
    make.left.equalTo(self.albumView.mas_right).with.offset(8);
    make.right.equalTo(self.trackPrice.mas_left).with.offset(-4);
  }];
  
  [self.trackPrice mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.albumName.mas_bottom).with.offset(4);
    make.right.equalTo(self.mas_right).with.offset(-8);
  }];
}

+ (CGFloat)heightForCell {
  return cellHeight;
}
@end
