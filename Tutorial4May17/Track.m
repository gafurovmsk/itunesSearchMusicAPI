//
//  Track.m
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "Track.h"

@interface Track()

@end

@implementation Track

- (instancetype)initWithName:(NSString *)name artist:(NSString *)artist album:(NSString *)album
    price:(NSString *)price andImage:(NSData*)image {
  
  self = [super init];
  if(!self) return nil;
  
  _trackName = name;
  _artistName = artist;
  _trackPrice = price;
  _albumImage = image;
  _albumName = album;
  
  return  self;
}

@end
