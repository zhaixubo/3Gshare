//
//  XinxiTableViewCell.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "XinxiTableViewCell.h"

@implementation XinxiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

- (void)layoutSubviews {
    self.imageview.frame = CGRectMake(10, 10, 110, 110);
    self.FirstLabel.frame = CGRectMake(150, 10, 200, 30);
    self.FirstLabel.font = [UIFont systemFontOfSize:25];
    self.SecondLabel.frame = CGRectMake(150, 40, 200, 20);
    //self.SecondLabel.font = [UIFont systemFontOfSize:18];
    self.ThirdLabel.frame = CGRectMake(150, 80, 280, 20);
    
    self.xin.frame = CGRectMake(150, 102, 20, 18);
    self.chakan.frame = CGRectMake(215, 102, 23, 18);
    self.fenxiang.frame = CGRectMake(280, 102, 23, 18);
    [self.xin setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    self.chakan.image = [UIImage imageNamed:@"button_guanzhu.png"];
    [self.fenxiang setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    
    //UIColor *newblue = [UIColor colorWithRed:(50.0f / 255.0f) green:(57.0f / 255.0f)blue:(74.0f / 255.0f) alpha:1.0f];
    [self.imageview setImage:[UIImage imageNamed:@"list_img1.png"]];
    self.xinlabel.frame = CGRectMake(172, 102, 30, 18);
    self.chakanlabel.frame = CGRectMake(242, 102, 30, 18);
    self.fenxianglabel.frame = CGRectMake(310, 102, 30, 18);
    
    [_xin addTarget:self action:@selector(pressxin:) forControlEvents:UIControlEventTouchUpInside];
    _xin.tag = 1;
    
    [_fenxiang addTarget:self action:@selector(pressfenxiang:) forControlEvents:UIControlEventTouchUpInside];
    _fenxiang.tag = 3;
    
    self.FirstLabel.text = @"share小白";
    self.SecondLabel.text = @"iOS爱好者";
    self.ThirdLabel.text = @"开心就笑，不开心就待会笑";
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
