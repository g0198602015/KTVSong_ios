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
    BOOL bMore;
    int moreUIStackViewHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    searchResult = [[NSMutableArray alloc] init];
    int width = self.jumpButton.frame.size.width;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    bMore = NO;
    recipes = @[@"A", @"B", @"C", @"D"];
    thumbnails = @[@"creme_brelee.jpg",@"dingfangweishi.png",@"userImg.png",@"creme_brelee.jpg"];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    int width = self.jumpButton.frame.size.width;
    if (self.moreUIStackView.frame.size.height != 0)
        moreUIStackViewHeight = self.moreUIStackView.frame.size.height;
    [[self sexSegmentedButton] initWithTitles:[NSArray arrayWithObjects:@"All", @"Female", @"Male", nil] buttonTintNormal:[UIColor colorWithWhite:.9 alpha:1] buttonTintPressed:[UIColor colorWithWhite:.8 alpha:1] actionHandler:^(int buttonIndex) {
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];
    if ([[self sexSegmentedButton] IsFinishInitial] == NO)
    {
        [self ShowMoreSettingView:NO];
    }

    // [self ShowMoreSettingView:NO];
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
- (IBAction)moreButtonTouchDown:(id)sender {
    bMore = !bMore;
    [self ShowMoreSettingView:bMore];
}

- (IBAction)searchButtonDown:(id)sender {

}

- (void)ShowMoreSettingView:(BOOL)show
{
    if (show)
        self.moreUIStackViewHeight.constant = moreUIStackViewHeight;
    else
        self.moreUIStackViewHeight.constant = 0;
}
@end
