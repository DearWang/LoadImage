//
//  ViewController.m
//  LoadImage
//
//  Created by 灵智创优001 on 17/5/18.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ImageModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong ) UITableView *tableView;

@property (nonatomic , strong ) NSMutableArray *dataSource;

@end

@implementation ViewController

- (UITableView* )tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"tableViewCellIdentifier"];
        
        [self.view addSubview:_tableView];
        
        
    }
    
    return _tableView;
}

- (NSMutableArray*)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray arrayWithCapacity:0];
        
    }
    
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"主页";
    
   [self loadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadData{
    
    NSArray *imageUrl = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495178928733&di=4214d2f83055b5be3a8177c6e3d38c38&imgtype=0&src=http%3A%2F%2Fi3.bbs.fd.zol-img.com.cn%2Ft_s1200x5000%2Fg4%2FM00%2F04%2F0E%2FCg-4WlO9LXCIZWEaAA5a7I3lNfEAAPbMQPK-sQADlsE253.jpg,https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495179056547&di=4a58112c4d79ea700276fdb2ea5e4629&imgtype=0&src=http%3A%2F%2Fnews.hainan.net%2FEditor%2Fimg%2F201602%2F20160223%2Fbig%2F20160223100053487_3747161.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495176206037&di=31ceae0d41334d2afd66ce5e545f6e7f&imgtype=0&src=http%3A%2F%2Fimg.sc115.com%2Fhb%2Fgx%2F01%2F881508224712475.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495176233583&di=e702c887a9bb88737f8e3a61f24c052d&imgtype=0&src=http%3A%2F%2Fimage.tianjimedia.com%2FuploadImages%2F2015%2F162%2F40%2F9321975WAX4G.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495179054954&di=e385b82be9576ee49f9ae70f9c64673c&imgtype=0&src=http%3A%2F%2Fimage.tianjimedia.com%2FuploadImages%2F2015%2F163%2F38%2F1XJ2VX9Y0HKD.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495179056548&di=9b4a3b24425bfe4508aafe81e59d53c3&imgtype=0&src=http%3A%2F%2Fuserimage8.360doc.com%2F17%2F0120%2F17%2F39474134_201701201705170186336099.jpg"];
    
    for (NSString *url in imageUrl) {
        
        ImageModel *model = [ImageModel new];
        
        model.imageUrl = url;
        
        if ([[url componentsSeparatedByString:@","] count] > 1) {
            
            model.imageName = @"多组图片展示";
            
        }else{
            
            model.imageName = @"单个图片展示";
        }
        
        
        [self.dataSource addObject:model];
   
    }
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(cell == nil) {
        
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCellIdentifier"];
        
    }else{
        
        //防复用设置 删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
        
    }
    
    cell.model = self.dataSource[indexPath.section];
    
    cell.changeCellHeight = ^{
        
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
    };

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    ImageModel *model= self.dataSource [indexPath.section];
    
    if (model.cellHeight == 20) {
        
        model.cellHeight = 150;
    }
    
    return model.cellHeight;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
     return section > 0 ?  10 : 0.01 ;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
