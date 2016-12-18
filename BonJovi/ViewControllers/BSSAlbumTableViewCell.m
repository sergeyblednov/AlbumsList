//
//  BSSAlbumTableViewCell.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSAlbumTableViewCell.h"

@interface BSSAlbumTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BSSAlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAlbum:(BSSAlbum *)album
{
    _album = album;
//    self.artworkImageView = 
    self.nameLabel.text = album.name;
}

@end
