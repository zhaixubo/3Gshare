//
//  holidayViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol xindelegate <NSObject>

- (void)changexin:(int)i:(int)j;

@end


@interface holidayViewController : ViewController

@property (assign, nonatomic) id<xindelegate> delegate;

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, assign) int xinnum;
@property (nonatomic, assign) int fenxiangnum;
@property (nonatomic, strong) UILabel *firstlabel;
@property (nonatomic, strong) UILabel *secondlabel;
@property (nonatomic, strong) UILabel *thirdlabel;

@property (nonatomic, strong) UIButton *firstbutton;
@property (nonatomic, strong) UIButton *secondbutton;
@property (nonatomic, strong) UIButton *thirdbutton;

@property (nonatomic, strong) UILabel *xinlabel;
@property (nonatomic, strong) UILabel *chakanlabel;
@property (nonatomic, strong) UILabel *fenxianglabel;
@end

NS_ASSUME_NONNULL_END
