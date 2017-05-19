//
//  TableViewCell.m
//  LoadImage
//
//  Created by 灵智创优001 on 17/5/18.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic,strong)UIView *backView;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        self.Icon = [[UIImageView alloc] init];
        
        self.imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, SWIDTH, 18)];
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SWIDTH, 150)];
        
        [self addSubview:_backView];
        
        [self addSubview:self.imageLabel];
    
    }
    
    return self;
}

- (void)setModel:(ImageModel *)model {
    
    _model = model;
    self.imageLabel.text = model.imageName;
    self.imageLabel.textColor = UIColorFromHex(0x4A4A4A);
    self.imageLabel.textAlignment = NSTextAlignmentCenter;
    self.imageLabel.font = [UIFont systemFontOfSize:13];

    
     __block CGFloat topicViewHeight = .0f;
    
    NSArray *imageUrls = [model.imageUrl componentsSeparatedByString:@","];
    
    NSLog(@"%@",imageUrls);
    
    for (int i = 0 ; i < imageUrls.count ; i++) {
        
        UIImageView *topicImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, SWIDTH - 20, 150)];
        
        @autoreleasepool {
            [topicImgView sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]]
                            placeholderImage:[UIImage imageNamed:@"topic_loading.png"]
                                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                                       
                                       if (image == nil) {
                                           image = [UIImage imageNamed:@"topic_faile"];
                                       }
                                       topicImgView.image = image;
                                       //显示高度
                                       CGFloat height =.0f;
                                       height = image.size.height * (SWIDTH - 20) / image.size.width;
                                       
                                       topicImgView.frame = CGRectMake(10, topicViewHeight +5, SWIDTH - 20, height);
                                       
                                     topicViewHeight += height;
                                       
                                       model.cellHeight = topicViewHeight+20;
                                       
                                       if (self.changeCellHeight) {
                                           self.changeCellHeight();
                                       }
                                       
                                   }];
            
            [_backView addSubview:topicImgView];
            _backView.frame = CGRectMake(0, 20, SWIDTH, topicViewHeight);
        }

        
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
