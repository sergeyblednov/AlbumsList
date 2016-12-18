//
//  BSSDataSource.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSDataSource.h"
#import "BSSAlbum.h"

@implementation BSSDataSource

- (NSArray *)getAlbums
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"albums" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *seriliazationError;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&seriliazationError];
    NSArray *items = [result objectForKey:@"results"];
    
    NSMutableArray *albums = [NSMutableArray arrayWithCapacity:items.count];
    for (NSDictionary *item in items) {
        NSString *albumName = [item objectForKey:@"collectionName"];
        if (albumName) {
            BSSAlbum *album = [[BSSAlbum alloc] init];
            album.name = albumName;
            album.artworkURLString = [item objectForKey:@"artworkUrl100"];
            [albums addObject:album];
        }
    }
    NSAssert(!seriliazationError, @"Unable to serialize");
    
    return albums;
}

@end
