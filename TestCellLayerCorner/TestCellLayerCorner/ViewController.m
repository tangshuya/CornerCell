//
//  ViewController.m
//  TestCellLayerCorner
//
//  Created by aaa on 2019/3/19.
//  Copyright © 2019年 TangShuya. All rights reserved.
//

#import "ViewController.h"
#import "cornerTableViewCell.h"

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0                                                     \
blue:((float)(rgbValue & 0xFF))/255.0                                                               \
alpha:1.0]

static NSString * const searchCellId = @"searchCellId";
@interface ViewController() <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UITableView   *visionSearchTableView;
@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
      self.view.backgroundColor = [UIColor greenColor];
    
    
    [self setupAuthenTableView];
}
-(void)setupAuthenTableView{
    self.visionSearchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 79, SCREEN_WIDTH, SCREEN_HEIGHT-79) style:UITableViewStyleGrouped];
    self.visionSearchTableView.delegate= self;
    self.visionSearchTableView.dataSource = self;
    self.visionSearchTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.visionSearchTableView.showsVerticalScrollIndicator = NO;
    self.visionSearchTableView.backgroundColor = [UIColor clearColor];
    //    self.visionSearchTableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    [self.visionSearchTableView setLayoutMargins:UIEdgeInsetsZero];
    [self.visionSearchTableView setSeparatorInset:UIEdgeInsetsZero];
    self.visionSearchTableView.scrollIndicatorInsets = self.visionSearchTableView.contentInset;
    
    // 分割线
    self.visionSearchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.visionSearchTableView registerClass:[cornerTableViewCell class] forCellReuseIdentifier:searchCellId];
    
    [self.view addSubview:self.visionSearchTableView];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[
                                                      @{@"title":@"shuydf",@"name":@"tsy",@"time":@"2019-01-07"},
                                                      @{@"title":@"shuydf",@"name":@"tsy",@"time":@"2019-01-07"},

                                                      @{@"title":@"shuydf",@"name":@"tsy",@"time":@"2019-01-07"},

                                                      
                                                      
                                                      ]];
    
    [self.visionSearchTableView reloadData];
}
//section的头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"v_round"]];
    imageView.frame = CGRectMake(15, 4, 15, 15);
    [redView addSubview:imageView];
    UILabel *dayLable = [[UILabel alloc] init];
    dayLable.font =[UIFont systemFontOfSize:14];
    dayLable.textColor = [UIColor grayColor];
    dayLable.frame = CGRectMake(35, 2, 200, 20);
    NSString *str  = @"2019-01-10 17:39:44";
    NSArray *bigArray = self.dataArray;
    NSMutableDictionary *dict = bigArray[section];
    str = dict[@"time"];
    
    [dayLable setText:str];
    [redView addSubview:dayLable];
    
    return redView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSMutableArray *array = self.dataArray[section];
//    return array.count;
    return 1;
//    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cornerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellId];
    if (cell == nil) {
        cell = [[cornerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellId];
    }
    //    取消选中的效果
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    //设置分割线
    NSMutableDictionary *array = self.dataArray[indexPath.section];
    cell.name = array[@"name"];
    return cell;
    
}
@end
