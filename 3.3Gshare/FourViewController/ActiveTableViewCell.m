//
//  ActiveTableViewCell.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ActiveTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation ActiveTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.imageview = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageview];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    
    return self;
}


- (void)layoutSubviews {
    self.imageview.frame = CGRectMake(5, 5, width - 5, 230);
    self.label.frame = CGRectMake(5, 240, 300, 15);
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
