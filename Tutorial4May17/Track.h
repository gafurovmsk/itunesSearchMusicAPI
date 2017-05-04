//
//  Track.h
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject


-(instancetype)initWithName:(NSString *)name artist:(NSString *)artist price:(NSString *) price andImage:(NSData*)image;

@end
