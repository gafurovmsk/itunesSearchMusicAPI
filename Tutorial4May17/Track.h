//
//  Track.h
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

@property (strong,nonatomic) NSString *trackName;
@property (strong,nonatomic) NSString *artistName;
@property (strong,nonatomic) NSString *trackPrice;
@property (strong,nonatomic) NSData *albumImage;
@property (strong,nonatomic) NSString *albumName;


- (instancetype)initWithName:(NSString *)name artist:(NSString *)artist album:(NSString *)album
    price:(NSString *)price andImage:(NSData*)image;

@end
