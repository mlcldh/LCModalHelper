//
//  UIView+LCModalHelper.m
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

#import "UIView+LCModalHelper.h"

@implementation UIView (LCModalHelper)

- (void)lc_removeConstraintsWithFirstItem:(id)firstItem firstAttribute:(NSLayoutAttribute)firstAttribute {//移除某一约束
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstItem == firstItem && constraint.firstAttribute == firstAttribute) {
            if ([constraint respondsToSelector:@selector(active)]) {
                constraint.active = NO;
            } else {
                [self removeConstraint:constraint];
            }
        }
    }
}

@end
