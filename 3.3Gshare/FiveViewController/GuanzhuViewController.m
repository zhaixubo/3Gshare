//
//  GuanzhuViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "GuanzhuViewController.h"

@interface GuanzhuViewController ()

@end

@implementation GuanzhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *newwhite = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    self.view.backgroundColor = newwhite;
    NSArray *arraylabel = [NSArray arrayWithObjects:@"小白", @"小绿", @"小蓝", @"小黄", nil];
    for (int i = 0; i < 4; i++) {
        NSString *strimage = [NSString stringWithFormat:@"remen%d.jpg",i + 1];
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:strimage]];
        imageview.frame = CGRectMake(10, 100 + 90 * i, 70, 70);
        [self.view addSubview:imageview];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(100, 110 + 90 * i, 200, 50);
        label.font = [UIFont systemFontOfSize:25];
        label.text = arraylabel[i];
        [self.view addSubview:label];
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
        button.frame = CGRectMake(300, 110 + 90 * i, 100, 50);
        button.tag = i + 1;
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(pressguanzhu:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem * btnNext = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressback)];
    btnNext.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = btnNext;
    
}
- (void) pressguanzhu:(UIButton *)button {
    if (button.tag < 50) {
        [button setImage:[UIImage imageNamed:@"guanzhu_pressed.png"] forState:UIControlStateNormal];
        button.tag += 100;
    } else {
        [button setImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
        button.tag -= 100;
    }
}

- (void)pressback {
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
