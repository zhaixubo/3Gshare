//
//  ThirdViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UITableView *firsttableview;
@property (nonatomic, strong) UITableView *secondtableview;
@property (nonatomic, strong) UITableView *thirdtableview;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

NS_ASSUME_NONNULL_END
