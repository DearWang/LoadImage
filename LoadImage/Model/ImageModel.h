//
//  ImageModel.h
//  LoadImage
//
//  Created by 灵智创优001 on 17/5/18.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
/**
 *  图片地址
 */
@property (nonatomic,copy) NSString *imageUrl;
/**
 *  图片Name
 */
@property (nonatomic,copy) NSString *imageName;
/**
 *  CellHeight
 */
@property (nonatomic, assign)CGFloat cellHeight;
@end
