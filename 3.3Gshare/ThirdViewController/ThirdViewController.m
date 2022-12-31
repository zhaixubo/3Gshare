//
//  ThirdViewController.m
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/25.
//

#import "ThirdViewController.h"
#import "ShareTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [[UIImage imageNamed:@"wenzhang.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage =[[UIImage imageNamed:@"wenzhang2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"文章";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.frame = CGRectMake(0, 50, width, 1000);
    _scrollview.contentSize = CGSizeMake(width * 3, 100);
    _scrollview.pagingEnabled = YES;
   // _scrollview.scrollEnabled = NO;
    //self.scrollview.showsHorizontalScrollIndicator = YES;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.alwaysBounceHorizontal = NO;
    _scrollview.alwaysBounceVertical = NO;
    _scrollview.bounces = YES;
    _scrollview.delegate = self;
    _scrollview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_scrollview];
    
    _segmentedControl = [[UISegmentedControl alloc] init];
       _segmentedControl.frame = CGRectMake(0, 100, width, 40);
       [_segmentedControl insertSegmentWithTitle:@"精选文章" atIndex:0 animated:YES];
       [_segmentedControl insertSegmentWithTitle:@"热门推荐" atIndex:1 animated:YES];
       [_segmentedControl insertSegmentWithTitle:@"全部文章" atIndex:2 animated:YES];
       [_segmentedControl addTarget:self action:@selector(pressSegmented:) forControlEvents:UIControlEventValueChanged];
       _segmentedControl.selectedSegmentIndex = 0;
       [self.view addSubview:_segmentedControl];
    
    _firsttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, width, 800) style:UITableViewStylePlain];
    _firsttableview.delegate = self;
    _firsttableview.dataSource = self;
    _firsttableview.tag = 1;
    [_scrollview addSubview:_firsttableview];
    
    _secondtableview = [[UITableView alloc] initWithFrame:CGRectMake(width, 50, width, 800) style:UITableViewStylePlain];
    _secondtableview.delegate = self;
    _secondtableview.dataSource = self;
    _secondtableview.tag = 2;
    [_scrollview addSubview:_secondtableview];
    
    _thirdtableview = [[UITableView alloc] initWithFrame:CGRectMake(width * 2, 50, width, 800) style:UITableViewStylePlain];
    _thirdtableview.delegate = self;
    _thirdtableview.dataSource = self;
    _thirdtableview.tag = 3;
    [_scrollview addSubview:_thirdtableview];
    
    [_firsttableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    [_secondtableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    [_thirdtableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
}


- (void)pressSegmented:(UISegmentedControl*)segmented {
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [_scrollview setContentOffset:CGPointMake(0, -40) animated:YES];
    } else if (_segmentedControl.selectedSegmentIndex == 1) {
        [_scrollview setContentOffset:CGPointMake(width, -40) animated:YES];
    } else if (_segmentedControl.selectedSegmentIndex == 2) {
        [_scrollview setContentOffset:CGPointMake(width * 2, -40) animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_scrollview.contentOffset.x == 0) {
        _segmentedControl.selectedSegmentIndex = 0;
    } else if (_scrollview.contentOffset.x == width) {
        _segmentedControl.selectedSegmentIndex = 1;
    } else if (_scrollview.contentOffset.x == width * 2) {
        _segmentedControl.selectedSegmentIndex = 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *firstarray1 = [[NSArray alloc] initWithObjects:@"假日", @"iOS", @"你的故事", @"再见", nil];
    NSArray *secondarray1 = [[NSArray alloc] initWithObjects:@"原创——插画——练习", @"原创——博客", @"原创——插画——剪辑", @"转载——插画——练习", nil];
    NSArray *thirdarray1 = [[NSArray alloc] initWithObjects:@"1分钟前", @"9小时前", @"11小时前", @"7小时前", nil];
    NSArray *fourarray1 = [[NSArray alloc] initWithObjects:@"share小白", @"share小黄", @"share小绿", @"share小红", nil];
    NSArray *imagearray1 = [[NSArray alloc] initWithObjects:@"jingxuan1.png", @"jingxuan2.png", @"jingxuan3.png", @"jingxuan4.png", nil];
    
    NSArray *firstarray2 = [[NSArray alloc] initWithObjects:@"iOS", @"安卓", @"后台", @"前端", nil];
    NSArray *secondarray2 = [[NSArray alloc] initWithObjects:@"原创——插画——练习", @"原创——博客", @"原创——插画——剪辑", @"转载——插画——练习", nil];
    NSArray *thirdarray2 = [[NSArray alloc] initWithObjects:@"25分钟前", @"43小时前", @"1小时前", @"4小时前", nil];
    NSArray *fourarray2 = [[NSArray alloc] initWithObjects:@"share小熊", @"share小牛", @"share小马", @"share小羊", nil];
    NSArray *imagearray2 = [[NSArray alloc] initWithObjects:@"remen1.jpg", @"remen2.jpg", @"remen3.jpg", @"remen4.jpg", nil];
    
    NSArray *firstarray3 = [[NSArray alloc] initWithObjects:@"梅西", @"C罗", @"内马尔", @"莱万", nil];
    NSArray *secondarray3 = [[NSArray alloc] initWithObjects:@"原创——插画——练习", @"原创——博客", @"原创——插画——剪辑", @"转载——插画——练习", nil];
    NSArray *thirdarray3 = [[NSArray alloc] initWithObjects:@"7分钟前", @"4小时前", @"10小时前", @"9小时前", nil];
    NSArray *fourarray3 = [[NSArray alloc] initWithObjects:@"share小西", @"share小东", @"share小南", @"share小北", nil];
    NSArray *imagearray3 = [[NSArray alloc] initWithObjects:@"quanbu1.jpg", @"quanbu2.jpg", @"quanbu3.jpg", @"quanbu4.jpg", nil];
    if (tableView.tag == 1) {
        ShareTableViewCell *cell = [_firsttableview dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
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
    } else if (tableView.tag == 2) {
        ShareTableViewCell *cell = [_secondtableview dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:imagearray2[indexPath.row]];
        cell.FirstLabel.text = firstarray2[indexPath.row];
        cell.SecondLabel.text = secondarray2[indexPath.row];
        cell.ThirdLabel.text = thirdarray2[indexPath.row];
        cell.FourLabel.text = fourarray2[indexPath.row];
        cell.xinlabel.text = @"26";
        cell.xinnum = 26;
        cell.chakanlabel.text = @"77";
        cell.fenxiangnum = 11;
        cell.fenxianglabel.text = @"11";
        return cell;
    } else {
        ShareTableViewCell *cell = [_thirdtableview dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.imageview.image = [UIImage imageNamed:imagearray3[indexPath.row]];
        cell.FirstLabel.text = firstarray3[indexPath.row];
        cell.SecondLabel.text = secondarray3[indexPath.row];
        cell.ThirdLabel.text = thirdarray3[indexPath.row];
        cell.FourLabel.text = fourarray3[indexPath.row];
        cell.xinlabel.text = @"66";
        cell.xinnum = 66;
        cell.chakanlabel.text = @"12";
        cell.fenxiangnum = 58;
        cell.fenxianglabel.text = @"58";
        return cell;
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
