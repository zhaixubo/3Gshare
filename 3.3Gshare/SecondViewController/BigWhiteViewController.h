//
//  BigWhiteViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BigWhiteViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UISearchBar *searchbar;
@property (nonatomic, strong) UITableView * tableView;
@end

NS_ASSUME_NONNULL_END
