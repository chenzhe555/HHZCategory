//
//  NSObject+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

#pragma mark 运行时获取相关信息
@interface NSObject (HHZUtils_RunTime)
/**
 *  通过运行时机制获取当前对象的方法名数组
 *
 *  @return
 */
-(NSArray *)hhz_getPrivateApiMethod;

/**
 *  通过运行时机制获取当前对象的属性名数组
 *
 *  @return
 */
-(NSArray *)hhz_getPrivateApiProperty;

/**
 *  通过运行时机制获取当前对象的属性名以及数据类型数组,index为0为属性名数组，index1为类型数组
 *
 *  @return
 */
-(NSArray *)hhz_getPrivateApiPropertyAndPropertyType;

@end

#pragma mark 通过运行时对model进行赋值
@interface NSObject (HHZUtils_Model)

/**
 *  用于服务器返回数据字典时，通过运行时机制对Model进行赋值，传入字典即可实现对model赋值，内部已实现异常处理
 *
 *  @param dict
 */
-(instancetype)convertModelWithDictionary_hhz:(NSDictionary *)dict;

@end

#pragma mark 通过运行时对model进行归解档

#define HHZ_AutoCoding \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode_hhz:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode_hhz:encoder]; \
}

@interface NSObject (HHZ_Archive)
/**
 *   添加忽略归档的成员变量
 *
 *  @return
 */
-(nullable NSArray *)ignoredMemberNames_hhz;

/**
 *  归档
 *
 *  @param encoder
 */
-(void)encode_hhz:(NSCoder *)encoder;

/**
 *  解档
 *
 *  @param decoder
 */
-(void)decode_hhz:(NSCoder *)decoder;

@end


@interface NSObject (HHZ_KVO)

/**
 *  对属性进行监听
 *
 *  @param kekPath 属性KeyPatj
 *  @param block   回调
 */
-(void)addObserverBlockForKeyPath_hhz:(NSString *)keyPath Block:(void (^)(__weak id obj,id oldValue,id newValue,void * context))block;

/**
 *  移除某个观察者(所有Context的)
 *
 *  @param keyPath 路径
 */
-(void)removeObserverKeyPath_hhz:(NSString *)keyPath;

/**
 *  移除某个观察者(特定context下的)
 *
 *  @param keyPath 路径
 *  @param context context标记
 */
-(void)removeObserverKeyPath_hhz:(NSString *)keyPath Context:(void *)context;

/**
 *  移除利用以上方法(addObserverBlockForKeyPath_hhz...)创建的所有观察者
 */
-(void)removeAllObserverStore_hhz;
@end

@interface NSObject (Exceptions)

@end

@interface NSObject (Check)

/**
 如果不是数组返回 nil
 */
-(instancetype)ArrayValue;
/**
 如果不是字典返回 nil
 */
-(instancetype)DictionaryValue;

@end

NS_ASSUME_NONNULL_END
