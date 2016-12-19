//
//  BSSListTableViewController.m
//  BonJovi
//
//  Created by Sergiy Blednov on 12/18/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

#import "BSSListTableViewController.h"
#import "BSSAlbumTableViewCell.h"
#import "BSSDataSource.h"
#import "BSSAlbumViewController.h"

@interface BSSListTableViewController ()

@property (nonatomic) NSArray *albums;
@property (nonatomic) BSSDataSource *dataSource;

@end

@implementation BSSListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = [[BSSDataSource alloc] init];
    self.albums = [self.dataSource getAlbums];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSSAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    cell.album = self.albums[indexPath.row];
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AlbumDetails"]) {
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
            BSSAlbum *album = self.albums[indexPath.row];
            ((BSSAlbumViewController *)segue.destinationViewController).album = album;
        }
    }
}


@end
