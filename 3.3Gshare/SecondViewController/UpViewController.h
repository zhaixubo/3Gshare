//
//  UpViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "ViewController.h"
#import "PhotoViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UpViewController : ViewController <PhotoDelegate, UITableViewDelegate, UITableViewDataSource>
- (void)changephoto:(NSString *)str :(int)num;

@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cellbutton;
@property (nonatomic, strong) NSMutableArray *cellarray;

@end

NS_ASSUME_NONNULL_END
