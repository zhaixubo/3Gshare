//
//  FiveViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FiveViewController : ViewController <UITableViewDelegate, UITableViewDataSource >

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
