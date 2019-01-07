//
//  NSDictionary+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSDictionary+HHZCategory.h"
#import <objc/runtime.h>

#pragma mark NSDictionary

@implementation NSDictionary (HHZ_NSDictionary)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:[NSString stringWithFormat:@"\n %p {\n",self]];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"%@(%@) = \n\t\t\t%@;\n" ,key,[obj class], obj];
    }];
    
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

-(NSArray *)hhz_allSortedKeys
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(id)getValueByKeys:(NSArray *)keys
{
    if (keys.count > 0) {
        id obj = self.mutableCopy;
        for (int i = 0; i < keys.count; ++i) {
            obj = [obj objectForKey:keys[i]];
            if ((i < keys.count - 1) && ![obj isKindOfClass:[NSDictionary class]]) return nil;
        }
        return obj;
    } else {
        return nil;
    }
}
@end





#pragma mark NSMutableDictionary
@implementation NSMutableDictionary (HHZ_NSMutableDictionary)

+(void)load
{
    //替换setObject:forKey:实现
    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method method2 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(hhz_setObject:forKey:));
    method_exchangeImplementations(method1, method2);
}

-(void)hhz_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey) {
        if (anObject) {
            [self hhz_setObject:anObject forKey:aKey];
        } else {
            [self hhz_setObject:[NSNull null] forKey:aKey];
        }
    }
}

@end
