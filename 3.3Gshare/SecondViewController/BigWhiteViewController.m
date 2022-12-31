//
//  BigWhiteViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "BigWhiteViewController.h"
#import "ShareTableViewCell.h"
@interface BigWhiteViewController ()

@end

@implementation BigWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 100, 410, 30)];
    _searchbar.text = @"大白";
    [_searchbar setTintColor: [UIColor whiteColor]];
    [_searchbar setBarTintColor: [UIColor whiteColor]];
    [self.view addSubview:_searchbar];
    
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 150, 430, 500) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    [self.view addSubview:_tableView];
}

//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"dabai1.jpg"];
        cell.FirstLabel.text = @"超能陆战";
        cell.SecondLabel.text = @"原创——UI——icon";
        cell.ThirdLabel.text = @"1秒前";
        cell.FourLabel.text = @"share小白";
        cell.xinlabel.text = @"16";
        cell.xinnum = 16;
        cell.chakanlabel.text = @"16";
        cell.fenxiangnum = 66;
        cell.fenxianglabel.text = @"66";
        
        return cell;
    } else {
        ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:@"dabai2.jpg"];
        cell.FirstLabel.text = @"大白";
        cell.SecondLabel.text = @"原创作品——摄影";
        cell.ThirdLabel.text = @"8秒前";
        cell.FourLabel.text = @"share小白";
        cell.xinlabel.text = @"28";
        cell.xinnum = 28;
        cell.chakanlabel.text = @"99";
        cell.fenxiangnum = 13;
        cell.fenxianglabel.text = @"13";
        return cell;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchbar resignFirstResponder];
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
