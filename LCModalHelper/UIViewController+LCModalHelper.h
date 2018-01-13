//
//  UIViewController+LCModalHelper.h
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCModalHelper.h"

@interface UIViewController (LCModalHelper)

@property (nonatomic,strong) LCModalHelper *el_presentationDelegate;

- (void)el_createPresentationDelegateIfNeeded;

@end
