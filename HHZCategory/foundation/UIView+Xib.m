//
//  UIView+Xib.m
//  HHZCategory
//
//  Created by yunshan on 2018/11/3.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "UIView+Xib.h"

@implementation UIView (Xib)

-(void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

@end
