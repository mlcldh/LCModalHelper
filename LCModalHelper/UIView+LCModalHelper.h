//
//  UIView+LCModalHelper.h
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LCModalHelper)

/*!移除某一约束*/
- (void)lc_removeConstraintsWithFirstItem:(id)firstItem firstAttribute:(NSLayoutAttribute)firstAttribute;

@end
