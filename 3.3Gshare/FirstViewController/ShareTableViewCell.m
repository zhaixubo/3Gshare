//
//  ShareTableViewCell.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ShareTableViewCell.h"

@implementation ShareTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _xinnum = 0;
    _fenxiangnum = 0;
    
    self.imageview = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageview];
    
    self.FirstLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FirstLabel];
    
    self.SecondLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SecondLabel];
    
    self.ThirdLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _ThirdLabel];
    
    self.FourLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FourLabel];
    
    self.FiveLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FiveLabel];
    
    self.SixLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SixLabel];
    
    self.SevenLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SevenLabel];
    
    self.xin = [[UIButton alloc] init];
    [self.contentView addSubview: _xin];
    
    self.chakan = [[UIImageView alloc] init];
    [self.contentView addSubview: _chakan];
    
    self.fenxiang = [[UIButton alloc] init];
    [self.contentView addSubview: _fenxiang];
    
    self.fenxianglabel = [[UILabel alloc] init];
    [self.contentView addSubview: _fenxianglabel];
    
    self.xinlabel = [[UILabel alloc] init];
    [self.contentView addSubview: _xinlabel];
    
    self.chakanlabel = [[UILabel alloc] init];
    [self.contentView addSubview: _chakanlabel];
    

    return self;
}

- (void)layoutSubviews {
    self.imageview.frame = CGRectMake(5, 20, 200, 150);
    self.FirstLabel.frame = CGRectMake(220, 30, 200, 30);
    self.FirstLabel.font = [UIFont systemFontOfSize:25];
    self.SecondLabel.frame = CGRectMake(220, 70, 200, 20);
    self.SecondLabel.font = [UIFont systemFontOfSize:18];
    self.ThirdLabel.frame = CGRectMake(220, 90, 100, 20);
    self.FourLabel.frame = CGRectMake(330, 40, 100, 20);
    
    self.xin.frame = CGRectMake(220, 140, 20, 18);
    self.chakan.frame = CGRectMake(285, 140, 23, 18);
    self.fenxiang.frame = CGRectMake(350, 140, 23, 18);
    [self.xin setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    self.chakan.image = [UIImage imageNamed:@"button_guanzhu.png"];
    [self.fenxiang setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    
    //UIColor *newblue = [UIColor colorWithRed:(50.0f / 255.0f) green:(57.0f / 255.0f)blue:(74.0f / 255.0f) alpha:1.0f];
    self.xinlabel.frame = CGRectMake(245, 140, 30, 18);
    self.chakanlabel.frame = CGRectMake(312, 140, 30, 18);
    self.fenxianglabel.frame = CGRectMake(380, 140, 30, 18);
    
    [_xin addTarget:self action:@selector(pressxin:) forControlEvents:UIControlEventTouchUpInside];
    _xin.tag = 1;
    
    [_fenxiang addTarget:self action:@selector(pressfenxiang:) forControlEvents:UIControlEventTouchUpInside];
    _fenxiang.tag = 3;
}

- (void)pressxin:(UIButton *)button {
    if (_xin.tag == 1) {
        _xinnum++;
        _xin.tag = 0;
        
        NSString *str = [NSString stringWithFormat:@"%d",_xinnum];
        self.xinlabel.text = str;
        [button setImage:[UIImage imageNamed:@"redzan.png"] forState:UIControlStateNormal];
    } else {
        _xinnum--;
        _xin.tag = 1;
        NSString *str = [NSString stringWithFormat:@"%d",_xinnum];
        self.xinlabel.text = str;
        [button setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    }
}

- (void)pressfenxiang:(UIButton*)button {
    _fenxiangnum++;
    NSString *str = [NSString stringWithFormat:@"%d",_fenxiangnum];
    self.fenxianglabel.text = str;
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
