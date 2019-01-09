//
//  NSDictionary+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark NSDictionary
@interface NSDictionary (HHZ_NSDictionary)

/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSDictionary打印的description方法，打印的时候能很清楚看到中文字符
 *
 *  @param locale
 *
 *  @return
 */
-(NSString *)descriptionWithLocale:(id)locale;

/**
 *  不区分大小，输出排序后的Key
 *
 *  @return 排序后的Key
 */
-(nullable NSArray *)hhz_allSortedKeys;

/**
 *  获取多级key下的value值
 *
 *  keys: @[@"aa",@"bb",@"ccc"]
 *
 *  @return 多级key下的value值
 */
-(id)getValueByKeys:(NSArray *)keys;

@end






#pragma mark NSMutableDictionary

@interface NSMutableDictionary (HHZ_NSMutableDictionary)

@end

NS_ASSUME_NONNULL_END
