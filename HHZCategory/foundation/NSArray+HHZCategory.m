//
//  NSArray+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSArray+HHZCategory.h"
#import <objc/runtime.h>

#pragma mark NSArray

@implementation NSArray (HHZ_NSArray)

+(void)load
{
    //替换objectAtIndex实现
    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method method2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(hhz_objectAtIndex:));
    method_exchangeImplementations(method1, method2);
    
    //替换objectAtIndexedSubscript实现
    Method method3 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method method4 = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(hhz_objectAtIndexedSubscript:));
    method_exchangeImplementations(method3, method4);
}


/**
 格式化输出数组
 */
-(nullable NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:[NSString stringWithFormat:@"\n %p (\n",self]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutaStr appendFormat:@"%lu(%@):\n\t%@\n", (unsigned long)idx,[obj class],obj];
    }];
    
    [mutaStr appendString:@")"];
    
    return mutaStr;
}

/**
 数组角标
 */
- (id)hhz_objectAtIndexedSubscript:(NSUInteger)idx
{
    return (idx >= 0 && idx < self.count) ? [self hhz_objectAtIndexedSubscript:idx] : nil;
}

/**
 数组索引
 */
-(id)hhz_objectAtIndex:(NSInteger)index
{
    return (index >= 0 && index < self.count) ? [self hhz_objectAtIndex:index] : nil;
}

@end

#pragma mark NSMutableArray

@implementation NSMutableArray (HHZ_NSMutableArray)

+(void)load
{    
    //替换objectAtIndex实现
    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method method2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(hhz_addObject:));
    method_exchangeImplementations(method1, method2);
    
    //替换insertObject:atIndex实现
    Method method3 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method method4 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(hhz_insertObject:atIndex:));
    method_exchangeImplementations(method3, method4);
    
}


/**
 数组添加元素
 */
-(void)hhz_addObject:(id)anObject
{
    if (anObject) [self hhz_addObject:anObject];
}

/**
 数组插入元素
 */
-(void)hhz_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index >= 0) [self hhz_insertObject:anObject atIndex:index];
}
@end
