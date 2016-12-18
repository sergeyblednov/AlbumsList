//
//  BSSAlbum.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSAlbum.h"

@implementation BSSAlbum

- (NSURL *)artworkURL
{
    return [NSURL URLWithString:self.artworkURLString];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> Name: %@", [self class], self, self.name];
}

@end
