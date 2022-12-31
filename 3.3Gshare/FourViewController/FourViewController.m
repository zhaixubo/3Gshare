//
//  FourViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "FourViewController.h"
#import "ActiveTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [[UIImage imageNamed:@"huodong.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage =[[UIImage imageNamed:@"huodong2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ActiveTableViewCell class] forCellReuseIdentifier:@"four"];
    [self.view addSubview:_tableView];
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"活动";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;

    
}
//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 280;
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActiveTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"four" forIndexPath:indexPath];
    NSArray *array = [NSArray arrayWithObjects:@"下厨也要美美的，从一条围裙开始",@"MIMU主题市场让你的创意改变世界",@"千万花粉为你而来", nil];
    
    cell.label.text = array[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"four%d.png",indexPath.row + 1];
    cell.imageview.image = [UIImage imageNamed:str];
    return cell;
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
