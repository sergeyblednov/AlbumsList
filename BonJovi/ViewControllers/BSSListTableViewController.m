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

@interface BSSListTableViewController () <UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic) NSArray *albums;
@property (nonatomic) NSArray *filteredAlbums;

@property (nonatomic) BSSDataSource *dataSource;
@property (nonatomic) UISearchController *searchController;
@property (assign, nonatomic, getter = isAscending) BOOL ascending;

@end

@implementation BSSListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = [[BSSDataSource alloc] init];
    self.albums = [self.dataSource getAlbums];
    self.filteredAlbums = self.albums;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;    
    self.searchController.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    self.ascending = NO;
}

- (void)searchForText:(NSString *)search
{
    if (search.length) {
        self.filteredAlbums = [self.albums filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.name contains[cd] %@", search]];
    } else {
        self.filteredAlbums = self.albums;
    }
}

#pragma mark - Action

- (IBAction)sortAlbumsByName
{
    self.ascending = !self.ascending;
    int sign = self.isAscending ? 1 : -1;
    self.albums = [self.albums sortedArrayUsingComparator:^NSComparisonResult(BSSAlbum *  _Nonnull obj1, BSSAlbum * _Nonnull obj2) {
        return sign * [obj1.name compare:obj2.name];
    }];
    self.filteredAlbums = self.albums;
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filteredAlbums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSSAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    cell.album = self.filteredAlbums[indexPath.row];
    
    return cell;
}

#pragma mark - Search Result Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self searchForText:searchString];
    [self.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AlbumDetails"]) {
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
            BSSAlbum *album;
            if (self.searchController.isActive) {
                album = self.filteredAlbums[indexPath.row];
            } else {
                album = self.albums[indexPath.row];
            }
            ((BSSAlbumViewController *)segue.destinationViewController).album = album;
        }
    }
}


@end
