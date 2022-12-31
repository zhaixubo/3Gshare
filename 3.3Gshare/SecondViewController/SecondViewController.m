//
//  SecondViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "SecondViewController.h"
#import "BigWhiteViewController.h"
#import "UpViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIColor *newblue = [UIColor colorWithRed:(66.0f / 255.0f) green:(140.0f / 255.0f)blue:(230.0f / 255.0f) alpha:1.0f];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [[UIImage imageNamed:@"sousuo.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage =[[UIImage imageNamed:@"sousuo2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 100, 410, 30)];
    [_searchbar setPlaceholder: @"大家都在搜 zxb10"];
    [_searchbar setTintColor: [UIColor whiteColor]];
    [_searchbar setBarTintColor: [UIColor whiteColor]];
    _searchbar.delegate = self;
    [self.view addSubview:_searchbar];
    
    
    UIView *firstview = [[UIView alloc] initWithFrame:CGRectMake(10, 160, 70, 25)];
    firstview.backgroundColor = newblue;
    [self.view addSubview:firstview];
    UIImageView *firstimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    firstimage.frame = CGRectMake(10, 160, 25, 25);
    [self.view addSubview:firstimage];
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 162, 45, 20)];
    firstlabel.text = @"分类";
    firstlabel.textColor = [UIColor whiteColor];
    [self.view addSubview:firstlabel];
    
    NSArray *array1 = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI",@"插画/手绘", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"虚拟设计", @"影视", @"摄影", @"其他", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(20 + i * 100, 195, 80, 30);
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
        button.frame = CGRectMake(20 + i * 100, 230, 80, 30);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:array2[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [self.view addSubview:button];
        button.tag = i + 5;
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:15];
    }
    
    
    UIView *secondview = [[UIView alloc] initWithFrame:CGRectMake(10, 270, 70, 25)];
    secondview.backgroundColor = newblue;
    [self.view addSubview:secondview];
    UIImageView *secondimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    secondimage.frame = CGRectMake(10, 270, 25, 25);
    [self.view addSubview:secondimage];
    UILabel *secondlabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 272, 45, 20)];
    secondlabel.text = @"推荐";
    secondlabel.textColor = [UIColor whiteColor];
    [self.view addSubview:secondlabel];
    
    NSArray *array3 = [NSArray arrayWithObjects:@"人气最高", @"收藏最多", @"评论最多", @"编辑精选", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(20 + i * 100, 300, 80, 30);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:array3[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [self.view addSubview:button];
        button.tag = i + 9;
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:15];
    }
    
    UIView *thirdview = [[UIView alloc] initWithFrame:CGRectMake(10, 340, 70, 25)];
    thirdview.backgroundColor = newblue;
    [self.view addSubview:thirdview];
    UIImageView *thirdimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button.png"]];
    thirdimage.frame = CGRectMake(10, 340, 25, 25);
    [self.view addSubview:thirdimage];
    UILabel *thirdlabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 342, 45, 20)];
    thirdlabel.text = @"时间";
    thirdlabel.textColor = [UIColor whiteColor];
    [self.view addSubview:thirdlabel];
    
    NSArray *array4 = [NSArray arrayWithObjects:@"30分钟前", @"1小时前", @"1月前", @"1年前", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(20 + i * 100, 370, 80, 30);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:array4[i] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [self.view addSubview:button];
        button.tag = i + 13;
        [button addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:15];
    }
    
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"搜索";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
   /* UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] init];
    [rightbutton setImage:[UIImage imageNamed:@"up.png"]];
    self.navigationItem.rightBarButtonItem = rightbutton;*/
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"up.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressup)];
    rightbutton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightbutton;
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchbar resignFirstResponder];
}

//搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if ([searchBar.text isEqualToString:@"大白"]) {
        BigWhiteViewController *vc = [[BigWhiteViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)pressup {
    UpViewController *vc = [[UpViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:vc animated:YES];
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
