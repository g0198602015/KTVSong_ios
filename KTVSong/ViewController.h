//
//  ViewController.h
//  KTVSong
//
//  Created by jerome on 6/14/16.
//  Copyright © 2016 jerome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>
{
    
}
- (IBAction)searchButtonDown:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@end

