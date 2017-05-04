//
//  Track.m
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "Track.h"

@interface Track()

@property (nonatomic,strong) NSString *trackName;
@property (nonatomic,strong) NSString *artistName;
@property (nonatomic,strong) NSString *trackPrice;
@property (nonatomic,strong) NSData *trackImage;



@end

@implementation Track

-(instancetype)initWithName:(NSString *)name artist:(NSString *)artist price:(NSString *) price andImage:(NSData*)image{
    
    self = [super init];
    if(!self) return nil;
    
    _trackName = name;
    _artistName = artist;
    _trackPrice = price;
    _trackImage = image;
    
    return  self;
}

@end
