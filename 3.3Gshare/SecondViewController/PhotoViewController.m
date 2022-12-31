//
//  PhotoViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "PhotoViewController.h"
#import "UpViewController.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择图片";
    self.view.backgroundColor = [UIColor whiteColor];
    _num = 0;
    for (int i = 0; i < 4; i++) {
        NSString *str = [NSString stringWithFormat: @"p%d.jpg",i + 1];
        UIImage *photo = [UIImage imageNamed:str];
        UIButton *firstbutton = [[UIButton alloc] initWithFrame:CGRectMake(5 + 105 * i, 100, 100, 100)];
        [firstbutton setImage:photo forState:UIControlStateNormal];
        [self.view addSubview: firstbutton];
        [firstbutton addTarget:self action:@selector(pressplus:) forControlEvents:UIControlEventTouchUpInside];
        firstbutton.tag = i + 1;

    }
    for (int i = 0; i < 4; i++) {
        NSString *str = [NSString stringWithFormat: @"p%d.jpg",i + 5];
        UIImage *photo = [UIImage imageNamed:str];
        UIButton *firstbutton = [[UIButton alloc] initWithFrame:CGRectMake(5 + 105 * i, 210, 100, 100)];
        [firstbutton setImage:photo forState:UIControlStateNormal];
        [self.view addSubview: firstbutton];
        [firstbutton addTarget:self action:@selector(pressplus:) forControlEvents:UIControlEventTouchUpInside];
        firstbutton.tag = i + 5;

    }
    
    UIBarButtonItem * btnNext = [[UIBarButtonItem alloc] initWithTitle:@"完成✅" style:UIBarButtonItemStylePlain target:self action:@selector(pressok)];
    btnNext.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = btnNext;
    
}

- (void)pressplus:(UIButton *)button {
    UIView *rightview = [[UIView alloc] init];
    rightview.backgroundColor = [UIColor greenColor];
    if (button.tag < 50) {
        _num++;
        _str = [NSMutableString stringWithFormat:@"p%d.jpg",button.tag];
        
        if (button.tag <= 4) {
            rightview.frame = CGRectMake(90 + 105 * (button.tag - 1), 100, 15, 15);
        } else {
            rightview.frame = CGRectMake(90 + 105 * (button.tag - 5), 210, 15, 15);
        }
        button.tag += 100;
        rightview.backgroundColor = [UIColor greenColor];
        [self.view bringSubviewToFront:rightview];
    } else {
        _num--;
        button.tag -= 100;
        [self.view bringSubviewToFront:button];
    }
    [self.view addSubview: rightview];
}

- (void)pressok {
    [_delegate changephoto:_str :_num];
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
