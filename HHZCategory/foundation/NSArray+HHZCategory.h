//
//  NSArray+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#pragma mark ----------->NSArray

@interface NSArray (HHZ_Log)

/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSArray打印的description方法，打印的时候能很清楚看到中文字符
 *
 *
 *  @param locale 未格式化的字符串
 *
 *  @return 显示的字符串
 */
-(nullable NSString *)descriptionWithLocale:(id)locale;

/**
 *  获取数组中Index的数据，不合法则返回nil
 *
 *  @param index 索引值
 *
 *  @return 对象/nil
 */
-(nullable id)hhz_objectAtIndex:(NSInteger)index;
@end



@interface NSArray (HHZ_Check)
/**
 *  多用于网络数据返回后的数组类型判断
 */
-(instancetype)hhz_check;


/**
 防止arr[@"key"]这种奔溃情况
 */
-(id)objectForKeyedSubscript:(NSString *)key;
@end



#pragma mark ----------->NSMutableArray

@interface NSMutableArray (HHZ_CRUD)
/**
 *  移除数组中第一个元素
 */
-(void)hhz_removeFirstObject;

/**
 *  移除数组中最后一个元素
 */
-(void)hhz_removeLastObject;

/**
 *  在数组中某个位置插入数组
 *
 *  @param arr   要插入的数组
 *  @param index 索引值
 */
-(void)hhz_insertArray:(NSArray *)arr atIndex:(NSUInteger)index;

/**
 *  将数组倒序
 */
-(void)hhz_reverseArray;

@end


NS_ASSUME_NONNULL_END
