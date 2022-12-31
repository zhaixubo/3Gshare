//
//  TuijianViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "TuijianViewController.h"
#import "ShareTableViewCell.h"

@interface TuijianViewController ()

@end

@implementation TuijianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    [self.view addSubview:_tableView];
}


//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 170;
}

//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *firstarray1 = [[NSArray alloc] initWithObjects:@"假日", @"你的故事", @"再见", nil];
    NSArray *secondarray1 = [[NSArray alloc] initWithObjects:@"原创——插画——练习", @"原创——博客", @"原创——插画——剪辑",  nil];
    NSArray *thirdarray1 = [[NSArray alloc] initWithObjects:@"1分钟前", @"9小时前", @"11小时前", nil];
    NSArray *fourarray1 = [[NSArray alloc] initWithObjects:@"share小白", @"share小黄", @"share小绿", nil];
    NSArray *imagearray1 = [[NSArray alloc] initWithObjects:@"jingxuan1.png", @"jingxuan2.png", @"jingxuan3.png", nil];
    ShareTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
    cell.imageview.image = [UIImage imageNamed:imagearray1[indexPath.row]];
    cell.FirstLabel.text = firstarray1[indexPath.row];
    cell.SecondLabel.text = secondarray1[indexPath.row];
    cell.ThirdLabel.text = thirdarray1[indexPath.row];
    cell.FourLabel.text = fourarray1[indexPath.row];
    cell.xinlabel.text = @"16";
    cell.xinnum = 16;
    cell.chakanlabel.text = @"27";
    cell.fenxiangnum = 66;
    cell.fenxianglabel.text = @"66";
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
