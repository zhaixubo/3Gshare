//
//  ShezhiViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "ShezhiViewController.h"
#import "ZiliaoViewController.h"
#import "XiaoxiViewController.h"
#import "XiugaiViewController.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface ShezhiViewController ()

@property (nonatomic, strong)XiaoxiViewController *xiaoxiViewController;
@property (nonatomic, strong)ZiliaoViewController *ziliaoViewController;

@end

@implementation ShezhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *newwhite = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    self.view.backgroundColor = newwhite;
    NSArray *labelarray = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(0, 100 + 50 * i, width, 49);
        button.tag = i + 1;
        [self.view addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 110 + 50 * i, 200, 30);
        label.text = labelarray[i];
        [self.view addSubview:label];
        
        UIImageView *jiantouview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiantou.png"]];
        jiantouview.frame = CGRectMake(350, 115 + 50 * i, 20, 20);
        [self.view addSubview:jiantouview];
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
    }
    _ziliaoViewController = [[ZiliaoViewController alloc] init];
    _xiaoxiViewController = [[XiaoxiViewController alloc] init];
}


- (void)pressbutton:(UIButton *)button {
    if (button.tag == 1) {

        [self.navigationController pushViewController:_ziliaoViewController animated:YES];
    } else if (button.tag == 2) {
        XiugaiViewController *vc = [[XiugaiViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (button.tag == 3) {

        [self.navigationController pushViewController:_xiaoxiViewController animated:YES];
    } else if (button.tag == 4) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"暂无内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (button.tag == 5) {
        _alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"缓存已清除" preferredStyle:UIAlertControllerStyleAlert];
        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:2   target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
        [self presentViewController:_alertController animated:YES completion:nil];
    }
}

- (void)timeOut{
    [_alertController dismissViewControllerAnimated:YES completion:nil];
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
