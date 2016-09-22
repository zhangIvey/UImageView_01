//
//  ImageModel.h
//  UImageView_01
//
//  Created by yaoln on 16/9/22.
//  Copyright © 2016年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *imageDescription;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)imageModel:(NSDictionary *)dic;


@end
