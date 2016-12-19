//
//  BSSAlbumTableViewCell.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSAlbumTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BSSAlbumTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BSSAlbumTableViewCell

- (void)setAlbum:(BSSAlbum *)album
{
    _album = album;
    [self.artworkImageView sd_setImageWithURL:album.artworkURL];
    self.nameLabel.text = album.name;
}

@end
