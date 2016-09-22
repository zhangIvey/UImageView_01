//
//  ImageModel.m
//  UImageView_01
//
//  Created by yaoln on 16/9/22.
//  Copyright © 2016年 zhangze. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self != nil) {
        NSString *tempImageName = dic[@"imageName"];
        NSString *tempImageDescription = dic[@"Description"];
        
        self.imageName = tempImageName;
        self.imageDescription = tempImageDescription;
    }
    return self;
}

+ (instancetype)imageModel:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}


@end
