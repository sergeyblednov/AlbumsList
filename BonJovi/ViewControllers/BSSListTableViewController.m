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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
