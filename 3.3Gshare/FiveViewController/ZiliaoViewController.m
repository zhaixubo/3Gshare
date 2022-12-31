//
//  ZiliaoViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "ZiliaoViewController.h"

@interface ZiliaoViewController ()

@end

@implementation ZiliaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 50, 100)];
    firstlabel.text = @"头像";
    firstlabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:firstlabel];
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img1.png"]];
    imageview.frame = CGRectMake(150, 100, 70, 70);
    [self.view addSubview:imageview];
    
    NSArray *bigarray = [NSArray arrayWithObjects:@"昵称", @"签名", @"性别", @"邮箱", nil];
    NSArray *smallarray = [NSArray arrayWithObjects:@"share小白", @"开心了就笑", @"", @"464574487@qq.com", nil];
    for (int i = 0; i < 4; i++) {
        UILabel *biglabel = [[UILabel alloc] init];
        biglabel.font = [UIFont systemFontOfSize:20];
        biglabel.frame = CGRectMake(30, 190 + 60 * i, 50, 50);
        biglabel.text = bigarray[i];
        [self.view addSubview:biglabel];
        
        UILabel *smalllabel = [[UILabel alloc] init];
        smalllabel.frame = CGRectMake(150, 190 + 60 * i, 200, 50);
        smalllabel.text = smallarray[i];
        [self.view addSubview:smalllabel];
    }
    
    UILabel *nanlabel = [[UILabel alloc] init];
    nanlabel.text = @"男";
    nanlabel.frame = CGRectMake(150, 310, 50, 50);
    [self.view addSubview:nanlabel];
    
    UILabel *nvlabel = [[UILabel alloc] init];
    nvlabel.text = @"女";
    nvlabel.frame = CGRectMake(220, 310, 50, 50);
    [self.view addSubview:nvlabel];
    
    _nanbutton = [[UIButton alloc] init];
    [_nanbutton setImage:[UIImage imageNamed:@"boy.png"] forState:UIControlStateNormal];
    _nanbutton.frame = CGRectMake(180, 325, 20, 20);
    [self.view addSubview:_nanbutton];
    [_nanbutton addTarget:self action:@selector(pressnan) forControlEvents:UIControlEventTouchUpInside];
    
    _nvbutton = [[UIButton alloc] init];
    [_nvbutton setImage:[UIImage imageNamed:@"girl.png"] forState:UIControlStateNormal];
    _nvbutton.frame = CGRectMake(250, 325, 20, 20);
    [self.view addSubview:_nvbutton];
    [_nvbutton addTarget:self action:@selector(pressnv) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressnan {
    [_nanbutton setImage:[UIImage imageNamed:@"boy.png"] forState:UIControlStateNormal];
    [_nvbutton setImage:[UIImage imageNamed:@"girl.png"] forState:UIControlStateNormal];
}

- (void)pressnv {
    [_nanbutton setImage:[UIImage imageNamed:@"girl.png"] forState:UIControlStateNormal];
    [_nvbutton setImage:[UIImage imageNamed:@"boy.png"] forState:UIControlStateNormal];
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
