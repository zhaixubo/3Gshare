//
//  LogViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "LogViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
@interface LogViewController ()
@property(nonatomic, strong) RegisterViewController *registerViewController;
@end
int i = 0;


@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kaijibeijing.png"]];
    UIImageView *firstview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tubiao1.jpg"]];
    firstview.frame = CGRectMake(135, 120, 160, 160);
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(137, 270, 200, 100)];
    firstLabel.text = @"SHARE";
    firstLabel.textColor = [UIColor whiteColor];
    firstLabel.font = [UIFont systemFontOfSize:50];
    
    [self.view addSubview:firstview];
    [self.view addSubview:firstLabel];
    
    _firstTextField = [[UITextField alloc] init];
    _firstTextField.frame = CGRectMake(80, 400, 275, 50);
    _firstTextField.backgroundColor = [UIColor whiteColor];
    _firstTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_img.png"]];
    _firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    _firstTextField.leftViewMode = UITextFieldViewModeAlways;
    _firstTextField.placeholder = @"请输入账号";
    [self.view addSubview:_firstTextField];
    
    _secondTextField = [[UITextField alloc] init];
    _secondTextField.frame = CGRectMake(80, 480, 275, 50);
    _secondTextField.backgroundColor = [UIColor whiteColor];
    _secondTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass_img.png"]];
    _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondTextField.leftViewMode = UITextFieldViewModeAlways;
    _secondTextField.placeholder = @"请输入密码";
    _secondTextField.secureTextEntry = YES;
    [self.view addSubview:_secondTextField];
    
    
    UIButton *leftbutton = [[UIButton alloc] init];
    leftbutton.layer.masksToBounds = YES;
    leftbutton.layer.cornerRadius = 10;
    [leftbutton setTitle:@"登录" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    leftbutton.titleLabel.textColor = [UIColor whiteColor];
    leftbutton.layer.borderWidth = 2;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    leftbutton.layer.borderColor = colorref;
    leftbutton.frame = CGRectMake(90, 570, 100, 50);
    [leftbutton addTarget:self action:@selector(pressdenglu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftbutton];
    
    UIButton *rightbutton = [[UIButton alloc] init];
    rightbutton.layer.masksToBounds = YES;
    rightbutton.layer.cornerRadius = 10;
    [rightbutton setTitle:@"注册" forState:UIControlStateNormal];
    rightbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    rightbutton.titleLabel.textColor = [UIColor whiteColor];
    rightbutton.layer.borderWidth = 2;
    rightbutton.layer.borderColor = colorref;
    rightbutton.frame = CGRectMake(245, 570, 100, 50);
    [rightbutton addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightbutton];
    
    UIButton *smallbutton = [[UIButton alloc] initWithFrame:CGRectMake(90, 650, 20, 20)];
    [smallbutton setImage:[UIImage imageNamed:@"unchecked1.png"] forState:UIControlStateNormal];
    UILabel *smalllabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 650, 100, 20)];
    smalllabel.text = @"自动登录";
    smalllabel.textColor = [UIColor blueColor];
    [smallbutton addTarget:self action:@selector(presssmall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:smalllabel];
    [self.view addSubview:smallbutton];
    
    self.firstTextField.delegate = self;
    self.secondTextField.delegate = self;
    
    _registerViewController = [[RegisterViewController alloc] init];
}
- (void)presssmall :(UIButton *)smallbutton{
    if (i == 0) {
        [smallbutton setImage:[UIImage imageNamed:@"checked1.png"]forState:UIControlStateNormal];
        i = 1;
    } else {
        [smallbutton setImage:[UIImage imageNamed:@"unchecked1.png"]forState:UIControlStateNormal];
        i = 0;
    }
}

- (void)pressright {

    _registerViewController.delegate = self;
    _registerViewController.modalPresentationStyle =  UIModalPresentationFullScreen;
    [self presentViewController:_registerViewController animated:YES completion:nil];
}
//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_firstTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, -100,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, 0,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)zhuce:(NSMutableArray *)zhanghaoarray: (NSMutableArray *)mimaarray {
    _zhang = [NSMutableArray arrayWithArray:zhanghaoarray];
    _mi = [NSMutableArray arrayWithArray:mimaarray];
}

- (void)pressdenglu {
    //登录成功
    int boo = 0;
    for (int i = 0; i < _zhang.count; i++) {
        if ([_zhang[i] isEqualToString:_firstTextField.text] && [_mi[i] isEqualToString:_secondTextField.text]) {
            boo = 1;
            break;
        }
    }
    
    if (boo == 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"恭喜" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:0.5   target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号密码不匹配" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)timeOut {
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    FourViewController *fourViewController = [[FourViewController alloc] init];
    FiveViewController *fiveViewController = [[FiveViewController alloc] init];
    UIColor *newblue = [UIColor colorWithRed:(66.0f / 255.0f) green:(140.0f / 255.0f)blue:(230.0f / 255.0f) alpha:1.0f];
    firstViewController.view.backgroundColor = [UIColor whiteColor];
    secondViewController.view.backgroundColor = [UIColor whiteColor];
    thirdViewController.view.backgroundColor = [UIColor whiteColor];
    fourViewController.view.backgroundColor = [UIColor whiteColor];
    fiveViewController.view.backgroundColor = [UIColor whiteColor];
    
    /*firstViewController.title = @"主页";
    secondViewController.title = @"搜索";
    thirdViewController.title = @"文章";
    fourViewController.title = @"活动";
    fiveViewController.title = @"个人";*/

    UINavigationController *FirstNavigationController = [[UINavigationController alloc] initWithRootViewController: firstViewController];
    UINavigationController *SecondNavigationController = [[UINavigationController alloc] initWithRootViewController: secondViewController];
    UINavigationController *ThirdNavigationController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    UINavigationController *FourNavigationController = [[UINavigationController alloc] initWithRootViewController: fourViewController];
    UINavigationController *FiveNavigationController = [[UINavigationController alloc] initWithRootViewController: fiveViewController];
    
    FirstNavigationController.navigationBar.backgroundColor = newblue;
    SecondNavigationController.navigationBar.backgroundColor = newblue;
    ThirdNavigationController.navigationBar.backgroundColor = newblue;
    FourNavigationController.navigationBar.backgroundColor = newblue;
    FiveNavigationController.navigationBar.backgroundColor = newblue;
    FirstNavigationController.navigationBar.barTintColor = newblue;
    SecondNavigationController.navigationBar.barTintColor = newblue;
    ThirdNavigationController.navigationBar.barTintColor = newblue;
    FourNavigationController.navigationBar.barTintColor = newblue;
    FiveNavigationController.navigationBar.barTintColor = newblue;
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    [appearance configureWithOpaqueBackground];
    appearance.backgroundColor = newblue;
    appearance.shadowColor = [UIColor clearColor];
    FirstNavigationController.navigationBar.standardAppearance = appearance;
    FirstNavigationController.navigationBar.scrollEdgeAppearance = FirstNavigationController.navigationBar.standardAppearance;
    SecondNavigationController.navigationBar.standardAppearance = appearance;
    SecondNavigationController.navigationBar.scrollEdgeAppearance = FirstNavigationController.navigationBar.standardAppearance;
    ThirdNavigationController.navigationBar.standardAppearance = appearance;
    ThirdNavigationController.navigationBar.scrollEdgeAppearance = FirstNavigationController.navigationBar.standardAppearance;
    FourNavigationController.navigationBar.standardAppearance = appearance;
    FourNavigationController.navigationBar.scrollEdgeAppearance = FirstNavigationController.navigationBar.standardAppearance;
    FiveNavigationController.navigationBar.standardAppearance = appearance;
    FiveNavigationController.navigationBar.scrollEdgeAppearance = FirstNavigationController.navigationBar.standardAppearance;

    
    NSArray *arrayViewController = [NSArray arrayWithObjects:FirstNavigationController, SecondNavigationController, ThirdNavigationController, FourNavigationController, FiveNavigationController, nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    tabBarController.viewControllers = arrayViewController;
    tabBarController.tabBar.backgroundColor = [UIColor blackColor];
    tabBarController.tabBar.translucent = YES;
    tabBarController.view.backgroundColor = [UIColor blackColor];
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    window.rootViewController = tabBarController;
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
