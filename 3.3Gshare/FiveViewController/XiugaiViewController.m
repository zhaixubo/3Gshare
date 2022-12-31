//
//  XiugaiViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "XiugaiViewController.h"

@interface XiugaiViewController ()

@end

@implementation XiugaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *newwhite = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    self.view.backgroundColor = newwhite;
    
    _firstTextField = [[UITextField alloc] init];
    _firstTextField.frame = CGRectMake(90, 120, 390, 50);
    _firstTextField.backgroundColor = [UIColor whiteColor];
    _firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    _firstTextField.placeholder = @"请输入原密码";
    _firstTextField.secureTextEntry = YES;
    [self.view addSubview:_firstTextField];
    
    _secondTextField = [[UITextField alloc] init];
    _secondTextField.frame = CGRectMake(90, 190, 390, 50);
    _secondTextField.backgroundColor = [UIColor whiteColor];
    _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondTextField.placeholder = @"请输入新密码";
    _secondTextField.secureTextEntry = YES;
    [self.view addSubview:_secondTextField];
    
    _thirdTextField = [[UITextField alloc] init];
    _thirdTextField.frame = CGRectMake(90, 260, 390, 50);
    _thirdTextField.backgroundColor = [UIColor whiteColor];
    _thirdTextField.borderStyle = UITextBorderStyleRoundedRect;
    _thirdTextField.placeholder = @"请再次输入新密码";
    _thirdTextField.secureTextEntry = YES;
    [self.view addSubview:_thirdTextField];
    
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 90)];
    firstlabel.text = @"旧密码";
    [self.view addSubview:firstlabel];
    
    UILabel *secondlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 100, 90)];
    secondlabel.text = @"新密码";
    [self.view addSubview:secondlabel];
    
    UILabel *thirdlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 100, 90)];
    thirdlabel.text = @"确认密码";
    [self.view addSubview:thirdlabel];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 370, 140, 50)];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(pressbutton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressbutton {
    if ([_secondTextField.text isEqualToString:_thirdTextField.text]) {
        _alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alertController addAction:sure];
        [self presentViewController:_alertController animated:YES completion:nil];
    } else {
        _alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"两次新密码输入不同" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alertController addAction:sure];
        [self presentViewController:_alertController animated:YES completion:nil];
    }
}

//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_firstTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
    [_thirdTextField resignFirstResponder];
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
