//
//  LCModalBaseTransitioning.h
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LCModalHeader.h"
#import "LCModalHelper.h"
#import "UIView+LCModalHelper.h"
#import "Masonry.h"

@class LCModalHelper;
@interface LCModalBaseTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

/***/
@property (nonatomic,weak) LCModalHelper *modalHelper;

@end
