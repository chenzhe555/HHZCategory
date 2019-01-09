//
//  NSURLSession+HHZCategory.m
//  HHZCategory
//
//  Created by yunshan on 2019/1/9.
//  Copyright © 2019 陈哲是个好孩子. All rights reserved.
//

#import "NSURLSession+HHZCategory.h"
#import <objc/runtime.h>

@implementation NSURLSession (HHZCategory)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //替换objectAtIndex实现
        Method method1 = class_getInstanceMethod([NSURLSession class], @selector(sessionWithConfiguration:));
        Method method2 = class_getInstanceMethod([NSURLSession class], @selector(hhz_sessionWithConfiguration:));
        method_exchangeImplementations(method1, method2);
        
        //替换objectAtIndex实现
        Method method3 = class_getInstanceMethod([NSURLSession class], @selector(sessionWithConfiguration:delegate:delegateQueue:));
        Method method4 = class_getInstanceMethod([NSURLSession class], @selector(hhz_sessionWithConfiguration:delegate:delegateQueue:));
        method_exchangeImplementations(method3, method4);        
    });
}

+ (NSURLSession *)hhz_sessionWithConfiguration:(NSURLSessionConfiguration *)configuration
                                     delegate:(nullable id<NSURLSessionDelegate>)delegate
                                delegateQueue:(nullable NSOperationQueue *)queue
{
    if(configuration) configuration.connectionProxyDictionary = @{};
    return [self hhz_sessionWithConfiguration:configuration delegate:delegate delegateQueue:queue];
}

+ (NSURLSession *)hhz_sessionWithConfiguration:(NSURLSessionConfiguration *)configuration
{
    if(configuration) configuration.connectionProxyDictionary = @{};
    return [self hhz_sessionWithConfiguration:configuration];
}
@end
