//
//  UpViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "UpViewController.h"
#import "PhotoViewController.h"

@interface UpViewController ()
@property (nonatomic, strong) UITableViewCell *cell0;
@end

@implementation UpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发布";
    UIColor *newblue = [UIColor colorWithRed:(66.0f / 255.0f) green:(140.0f / 255.0f)blue:(230.0f / 255.0f) alpha:1.0f];
    UIColor *newwhite = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    self.view.backgroundColor = newwhite;

    UIButton *firstbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 220, 150)];
    firstbutton.backgroundColor = [UIColor grayColor];
    [firstbutton setTitle:@"点击添加图片" forState:UIControlStateNormal];
    [self.view addSubview:firstbutton];
    [firstbutton addTarget:self action:@selector(pressphoto) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *dingwei = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_zan.png"]];
    dingwei.frame = CGRectMake(250, 130, 20, 20);
    [self.view addSubview:dingwei];
    
    UIView *secondview = [[UIView alloc] initWithFrame:CGRectMake(275, 130, 100, 20)];
    secondview.backgroundColor = newblue;
    [secondview.layer setMasksToBounds:YES];
    [secondview.layer setCornerRadius:10];
    [self.view addSubview:secondview];
    
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(277, 130, 100, 20)];
    firstlabel.text = @"陕西省，西安市";
    firstlabel.textColor = [UIColor whiteColor];
    firstlabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:firstlabel];
    NSArray *array1 = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI",@"插画/手绘", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"虚拟设计", @"影视", @"摄影", @"其他", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(20 + i * 100, 280, 80, 30);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:array1[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [self.view addSubview:button];
        button.tag = i + 1;
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:15];
    }
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(20 + i * 100, 315, 80, 30);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:array2[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [self.view addSubview:button];
        button.tag = i + 5;
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:15];
    }
    
    _firstTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 370, 420, 30)];
    _firstTextField.backgroundColor = [UIColor whiteColor];
    _firstTextField.placeholder = @"作品名称";
    [self.view addSubview: _firstTextField];
    _secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 420, 420, 80)];
    _secondTextField.backgroundColor = [UIColor whiteColor];
    _secondTextField.placeholder = @"请添加作品说明/文章内容";
    [self.view addSubview: _secondTextField];
    
    UIButton *fabutton = [[UIButton alloc] initWithFrame:CGRectMake(20, 520, 390, 50)];
    fabutton.backgroundColor = newblue;
    [fabutton setTitle:@"发布" forState:UIControlStateNormal];
    fabutton.tintColor = [UIColor whiteColor];
    [fabutton addTarget:self action:@selector(pressfabu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fabutton];
    
    UIButton *smallbutton = [[UIButton alloc] initWithFrame:CGRectMake(5, 585, 20, 20)];
    [smallbutton setImage:[UIImage imageNamed:@"unchecked1.png"] forState:UIControlStateNormal];
    UILabel *smalllabel = [[UILabel alloc] initWithFrame:CGRectMake(29, 585, 100, 20)];
    smalllabel.text = @"禁止下载";
    smallbutton.tag = 0;
    smalllabel.textColor = [UIColor blueColor];
    [smallbutton addTarget:self action:@selector(presssmall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:smalllabel];
    [self.view addSubview:smallbutton];
    
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(277, 160, 120, 25) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.view addSubview:_tableView];
    
    _cellbutton = [[UIButton alloc] init];
    _cellbutton.frame = CGRectMake(247, 160, 25, 25);
    [_cellbutton setImage:[UIImage imageNamed:@"buttonyes.png"] forState:UIControlStateNormal];
    [_cellbutton addTarget:self action:@selector(presszhankai:) forControlEvents:UIControlEventTouchUpInside];
    _cellbutton.tag = 1;
    [self.view addSubview: _cellbutton];
    
    _cellarray = [NSMutableArray arrayWithObjects:@"原创作品", @"设计资料", @"设计观点", @"设计教程", nil];
}
- (void)pressbutton:(UIButton *)button {
    UIColor *newblue = [UIColor colorWithRed:(66.0f / 255.0f) green:(140.0f / 255.0f)blue:(230.0f / 255.0f) alpha:1.0f];
    if (button.tag < 100) {
        button.backgroundColor = newblue;
        button.tintColor = [UIColor whiteColor];
        button.tag += 100;
    } else {
        button.backgroundColor = [UIColor whiteColor];
        button.tintColor = [UIColor blackColor];
        button.tag -= 100;
    }
}
- (void)presssmall :(UIButton *)smallbutton{
    if (smallbutton.tag == 0) {
        [smallbutton setImage:[UIImage imageNamed:@"checked1.png"]forState:UIControlStateNormal];
        smallbutton.tag = 1;
    } else {
        [smallbutton setImage:[UIImage imageNamed:@"unchecked1.png"]forState:UIControlStateNormal];
        smallbutton.tag = 0;
    }
}

- (void)pressfabu {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"发布成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:sure];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)pressphoto {
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)changephoto:(NSString *)str :(int)num {
    UIImageView *photoview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
    photoview.frame = CGRectMake(30, 100, 180, 150);
    [self.view addSubview:photoview];
    UILabel *photolabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 100, 20, 20)];
    photolabel.backgroundColor = [UIColor redColor];
    NSString *newnum = [NSString stringWithFormat:@" %d", num];
    photolabel.text = newnum;
    [self.view addSubview:photolabel];
    
}

- (void)presszhankai:(UIButton *)button {
    if (_cellbutton.tag == 1) {
        _tableView.frame = CGRectMake(277, 160, 120, 100);
        [_cellbutton setImage:[UIImage imageNamed:@"buttonno.png"] forState:UIControlStateNormal];
        _cellbutton.tag = 2;
        [_tableView reloadData];
    } else {
        _tableView.frame = CGRectMake(277, 160, 120, 25);
        [_cellbutton setImage:[UIImage imageNamed:@"buttonyes.png"] forState:UIControlStateNormal];
        _cellbutton.tag = 1;
        [_tableView reloadData];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = _cellarray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_cellbutton.tag == 1) {
        return 1;
    } else {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *str = [NSString stringWithString:_cell0.textLabel.text];
   
    for (int i = 0; i < 4; i++) {
        if ([_cellarray[i] isEqualToString:str]) {
            _cellarray[i] = _cellarray[0];
            break;
        }
    }
    _cellarray[0] = str;
    _tableView.frame = CGRectMake(277, 160, 120, 25);
    [_cellbutton setImage:[UIImage imageNamed:@"buttonyes.png"] forState:UIControlStateNormal];
    _cellbutton.tag = 1;
    [_tableView reloadData];
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
