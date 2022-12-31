//
//  FiveViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "FiveViewController.h"
#import "XinxiTableViewCell.h"
#import "FirstTableViewCell.h"
#import "ThirdViewController.h"
#import "MyxinxiViewController.h"
#import "TuijianViewController.h"
#import "ShezhiViewController.h"
@interface FiveViewController ()
@property (nonatomic, strong) FirstTableViewCell *cell0;
@property (nonatomic, strong) ShezhiViewController *shezhivc;
@property (nonatomic, strong) MyxinxiViewController *xinxivc;
@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [[UIImage imageNamed:@"geren.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage =[[UIImage imageNamed:@"geren2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"个人";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[XinxiTableViewCell class] forCellReuseIdentifier:@"xinxi"];
    [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [self.view addSubview:_tableView];
    
    _shezhivc = [[ShezhiViewController alloc] init];
    _xinxivc = [[MyxinxiViewController alloc] init];
}

//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return 130;
    } else {
        return 50;
    }
}

//设置tableView分区标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //return [NSString stringWithFormat:@"%c", section + 'A'];
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 430, 0)];
   //view.backgroundColor = [UIColor blackColor];
   return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *labelarray = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系设置", @"设置", @"推出", nil];
    if (indexPath.section == 0) {
        XinxiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"xinxi" forIndexPath:indexPath];
        cell.xinlabel.text = @"16";
        cell.xinnum = 16;
        cell.chakanlabel.text = @"16";
        cell.fenxiangnum = 66;
        cell.fenxianglabel.text = @"66";
        return cell;
    } else {
        NSString *imagestr = [NSString stringWithFormat:@"xinxi%d.png",indexPath.row];
        FirstTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.label.text = labelarray[indexPath.row];
        [cell.firstimageview setImage:[UIImage imageNamed:imagestr]];
        return cell;

    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
            ThirdViewController *vc = [[ThirdViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
            //MyxinxiViewController *vc = [[MyxinxiViewController alloc] init];
            [self.navigationController pushViewController:_xinxivc animated:YES];
        } else if (indexPath.row == 2) {
            _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
            TuijianViewController *vc = [[TuijianViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 3) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"暂无内容" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:sure];
            [self presentViewController:alertController animated:YES completion:nil];
        } else if (indexPath.row == 4) {
            _cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
            
            [self.navigationController pushViewController:_shezhivc animated:YES];
        } else if (indexPath.row == 5) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"暂无内容" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:sure];
            [self presentViewController:alertController animated:YES completion:nil];
        }
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
