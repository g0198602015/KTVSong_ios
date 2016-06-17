//
//  SimpleTableCellTableViewCell.h
//  KTVSong
//
//  Created by jerome on 6/14/16.
//  Copyright © 2016 jerome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *propLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
