//
//  ViewController.m
//  KTVSong
//
//  Created by jerome on 6/14/16.
//  Copyright © 2016 jerome. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCell.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *recipes;
    NSArray *thumbnails;
    NSMutableArray *searchResult;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    searchResult = [[NSMutableArray alloc] init];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    [self.searchController.searchBar sizeToFit];
   // self.tableView.tableHeaderView = self.searchController.searchBar;
    self.navigationItem.titleView = self.searchController.searchBar;
    //UINavigationControllerItem

    self.searchController.hidesNavigationBarDuringPresentation = NO;
    recipes = @[@"A", @"B", @"C", @"D"];
    thumbnails = @[@"creme_brelee.jpg",@"dingfangweishi.png",@"userImg.png",@"creme_brelee.jpg"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [searchResult removeAllObjects];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.searchController.searchBar.text];
    searchResult  = [[recipes filteredArrayUsingPredicate:searchPredicate]mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.active && ![self.searchController.searchBar.text isEqualToString:@""])
        return searchResult.count;
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *simpleTableIdentifier = @"SimpleTableCell";
    SimpleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    //cell.nameLabel.text = [recipes objectAtIndex:indexPath.row];
    id object = nil;
    if (self.searchController.active && ![self.searchController.searchBar.text isEqualToString:@""])
        object = searchResult;
    else
        object = recipes;
    cell.propLabel.text = [object objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.searchController.active)
    {
        self.searchController.active = NO;
        [self.searchController.searchBar removeFromSuperview];
    }
}
- (IBAction)searchButtonDown:(id)sender {
    [self performSegueWithIdentifier:@"ResultSegue" sender:self];
}

@end
