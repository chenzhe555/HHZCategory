//
//  NSURLSession+HHZCategory.h
//  HHZCategory
//
//  Created by yunshan on 2019/1/9.
//  Copyright © 2019 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSession (HHZCategory)

/**
 打开/关闭 是否允许抓包工具进行抓包
 */
+(void)modifyProxyCapturePackageConfig;
@end

NS_ASSUME_NONNULL_END
