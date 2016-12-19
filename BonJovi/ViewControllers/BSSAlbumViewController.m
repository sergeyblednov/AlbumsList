//
//  BSSAlbumViewController.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSAlbumViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BSSAlbumViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BSSAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
}

- (void)setAlbum:(BSSAlbum *)album
{
    _album = album;
    [self setupUI];
}

#pragma mark - Private

- (void)setupUI
{
    [self.imageView sd_setImageWithURL:self.album.artworkURL];
}


@end
