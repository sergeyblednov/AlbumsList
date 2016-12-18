//
//  BSSAlbum.h
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSSAlbum : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artworkURLString;

@property (nonatomic, readonly) NSURL *artworkURL;

@end
