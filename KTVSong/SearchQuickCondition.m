//
//  SearchQuickCondition.m
//  KTVSong
//
//  Created by jerome on 6/20/16.
//  Copyright © 2016 jerome. All rights reserved.
//

#import "SearchQuickCondition.h"

@interface SearchQuickCondition ()

@end

@implementation SearchQuickCondition
@synthesize segmentedButtonView;
- (void)viewDidLoad {
    [super viewDidLoad];
    [segmentedButtonView initWithTitles:[NSArray arrayWithObjects:@"All", @"Female", @"Male", nil] buttonTintNormal:[UIColor colorWithWhite:.9 alpha:1] buttonTintPressed:[UIColor colorWithWhite:.8 alpha:1] actionHandler:^(int buttonIndex) {
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
