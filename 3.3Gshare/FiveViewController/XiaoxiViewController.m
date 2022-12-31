//
//  XiaoxiViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "XiaoxiViewController.h"

@interface XiaoxiViewController ()

@end

@implementation XiaoxiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *labelarray = [NSArray arrayWithObjects:@"接受所有新消息通知", @"通知显示栏", @"声音", @"震动", @"关注更新", nil];
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(350, 115 + 50 * i, 20, 20);
        [button setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
        button.tag = i + 1;
        [self.view addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 110 + 50 * i, 200, 30);
        label.text = labelarray[i];
        [self.view addSubview:label];
        
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)pressbutton:(UIButton *)button {
    if (button.tag < 50) {
        [button setImage:[UIImage imageNamed:@"yes.png"] forState:UIControlStateNormal];
        button.tag += 100;
    } else {
        [button setImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
        button.tag -= 100;
    }
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
