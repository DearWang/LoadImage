//
//  TableViewCell.h
//  LoadImage
//
//  Created by 灵智创优001 on 17/5/18.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) ImageModel *model;

@property (nonatomic, strong) UIImageView *Icon;

@property (nonatomic, strong) UILabel *imageLabel;

@property (nonatomic, copy ) void (^changeCellHeight)();

@end


