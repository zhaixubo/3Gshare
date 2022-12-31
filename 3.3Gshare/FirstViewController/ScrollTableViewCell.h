//
//  ScrollTableViewCell.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
