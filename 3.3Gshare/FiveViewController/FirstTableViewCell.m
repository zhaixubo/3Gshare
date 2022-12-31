//
//  FirstTableViewCell.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.firstimageview = [[UIImageView alloc] init];
    [self.contentView addSubview:_firstimageview];
    
    self.secondimageview = [[UIImageView alloc] init];
    [self.contentView addSubview:_secondimageview];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void)layoutSubviews {
    _firstimageview.frame = CGRectMake(10, 10, 30, 30);
    _secondimageview.frame = CGRectMake(width - 50, 10, 30, 30);
    _label.frame = CGRectMake(60, 10, 100, 30);
    [_secondimageview setImage:[UIImage imageNamed:@"jiantou.png"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
