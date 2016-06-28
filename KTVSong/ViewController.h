//
//  ViewController.h
//  KTVSong
//
//  Created by jerome on 6/14/16.
//  Copyright © 2016 jerome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedButton.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>
{
    
}
- (void)ShowMoreSettingView:(BOOL)show;
- (IBAction)moreButtonTouchDown:(id)sender;
- (IBAction)searchButtonDown:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moreUIStackViewHeight;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)UISearchController *searchController;
@property (weak, nonatomic) IBOutlet SegmentedButton *sexSegmentedButton;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIStackView *moreUIStackView;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@end

