//
//  ShareTableViewCell.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *imageview;
@property (nonatomic, strong) UILabel *FirstLabel;
@property (nonatomic, strong) UILabel *SecondLabel;
@property (nonatomic, strong) UILabel *ThirdLabel;
@property (nonatomic, strong) UILabel *FourLabel;
@property (nonatomic, strong) UILabel *FiveLabel;
@property (nonatomic, strong) UILabel *SixLabel;
@property (nonatomic, strong) UILabel *SevenLabel;

@property (nonatomic, strong) UIButton *xin;
@property (nonatomic, strong) UIImageView *chakan;
@property (nonatomic, strong) UIButton *fenxiang;

@property (nonatomic, strong) UILabel *xinlabel;
@property (nonatomic, strong) UILabel *chakanlabel;
@property (nonatomic, strong) UILabel *fenxianglabel;

@property (nonatomic, assign) int xinnum;
@property (nonatomic, assign) int fenxiangnum;
@end

NS_ASSUME_NONNULL_END
