//
//  holidayViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "holidayViewController.h"
#import "FirstViewController.h"


@interface holidayViewController ()

@end

@implementation holidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.contentSize = CGSizeMake(430, 1400);
    _scrollview.frame = CGRectMake(0, 90, 430, 860);
    [self.view addSubview:_scrollview];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *touxiangview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_head.png"]];
    touxiangview.frame = CGRectMake(5, 5, 70, 70);
    [_scrollview addSubview:touxiangview];
    
    _firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 100, 20)];
    _firstlabel.text = @"假日";
    [_scrollview addSubview:_firstlabel];
    _firstlabel.font = [UIFont systemFontOfSize:20];
    
    _secondlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 45, 100, 20)];
    _secondlabel.text = @"share小白";
    [_scrollview addSubview:_secondlabel];
    
    _thirdlabel = [[UILabel alloc] initWithFrame:CGRectMake(350, 5, 80, 20)];
    _thirdlabel.text = @"15分钟前";
    [_scrollview addSubview:_thirdlabel];
    
    _firstbutton = [[UIButton alloc] initWithFrame:CGRectMake(280, 45, 15, 15)];
    if (_xinnum == 16) {
        [_firstbutton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        _firstbutton.tag = 0;
    } else {
        [_firstbutton setImage:[UIImage imageNamed:@"redzan.png"] forState:UIControlStateNormal];
        _firstbutton.tag = 1;
    }
    
    [_scrollview addSubview:_firstbutton];
    
    _secondbutton = [[UIButton alloc] initWithFrame:CGRectMake(330, 45, 15, 15)];
    [_secondbutton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_scrollview addSubview:_secondbutton];
    
    _thirdbutton = [[UIButton alloc] initWithFrame:CGRectMake(380, 45, 15, 15)];
    [_thirdbutton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    [_scrollview addSubview:_thirdbutton];
    
    _xinlabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 42, 30, 20)];
    _xinlabel.text = [NSString stringWithFormat:@"%d",_xinnum];
    [_scrollview addSubview:_xinlabel];
    
    _chakanlabel = [[UILabel alloc] initWithFrame:CGRectMake(350, 42, 30, 20)];
    _chakanlabel.text = @"16";
    [_scrollview addSubview:_chakanlabel];
    
    _fenxianglabel = [[UILabel alloc] initWithFrame:CGRectMake(400, 42, 30, 20)];
    _fenxianglabel.text = [NSString stringWithFormat:@"%d",_fenxiangnum];
    [_scrollview addSubview:_fenxianglabel];
    
    UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 100, 400, 30)];
    textlabel.text = @"多希望列车能把我带到有你的城市";
    [_scrollview addSubview:textlabel];
    
    UIImageView *firstimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img1.png"]];
    firstimageview.frame = CGRectMake(5, 140, 420, 200);
    [_scrollview addSubview:firstimageview];
    
    UIImageView *secondimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img2.png"]];
    secondimageview.frame = CGRectMake(5, 350, 420, 200);
    [_scrollview addSubview:secondimageview];
    
    UIImageView *thirdimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img3.png"]];
    thirdimageview.frame = CGRectMake(100, 560, 230, 200);
    [_scrollview addSubview:thirdimageview];
    
    UIImageView *fourimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img4.png"]];
    fourimageview.frame = CGRectMake(5, 770, 420, 200);
    [_scrollview addSubview:fourimageview];
    
    UIImageView *fiveimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img5.png"]];
    fiveimageview.frame = CGRectMake(100, 980, 230, 200);
    [_scrollview addSubview:fiveimageview];
    
    
    [_firstbutton addTarget:self action:@selector(firstpress:) forControlEvents:UIControlEventTouchUpInside];
    [_thirdbutton addTarget:self action:@selector(thirdpress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * btnNext = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressback)];
    btnNext.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = btnNext;
    
}
- (void)firstpress:(UIButton *)button {
    if (_firstbutton.tag == 0) {
        _xinnum++;
        _firstbutton.tag = 1;
        NSString *str = [NSString stringWithFormat:@"%d",_xinnum];
        self.xinlabel.text = str;
    } else {
        _xinnum--;
        _firstbutton.tag = 0;
        NSString *str = [NSString stringWithFormat:@"%d",_xinnum];
        self.xinlabel.text = str;
    }
}

- (void)thirdpress:(UIButton*)button {
    _fenxiangnum++;
    NSString *str = [NSString stringWithFormat:@"%d",_fenxiangnum];
    self.fenxianglabel.text = str;
}

- (void)pressback {
    [_delegate changexin:_xinnum :_fenxiangnum];
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
