//
//  NSArray+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark NSArray

@interface NSArray<ObjectType> (HHZ_NSArray)
/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSArray打印的description方法，打印的时候能很清楚看到中文字符
 *  @param locale 未格式化的字符串
 *  @return 显示的字符串
 */
-(nullable NSString *)descriptionWithLocale:(id)locale;
@end

#pragma mark ----------->NSMutableArray

@interface NSMutableArray (HHZ_NSMutableArray)

@end


NS_ASSUME_NONNULL_END
