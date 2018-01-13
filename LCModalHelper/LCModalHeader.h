//
//  LCModalHeader.h
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

#ifndef LCModalHeader_h
#define LCModalHeader_h

typedef NS_ENUM(NSInteger, LCPresentStartStyle) {
    LCPresentStartStyleFromTop,    //
    LCPresentStartStyleFromBottom,    //
    LCPresentStartStyleFromLeft,    //
    LCPresentStartStyleFromRight,    //
    //    LCPresentStartStyleFrom,    //
};
typedef NS_ENUM(NSInteger, LCPresentShownStyle) {
    LCPresentShownStyleAtCenter,    //
    LCPresentShownStyleAtTop,    //
    LCPresentShownStyleAtBottom,    //
    LCPresentShownStyleAtLeft,    //
    LCPresentShownStyleAtRight,    //
};
typedef NS_ENUM(NSInteger, LCModalLengthStyle) {
    LCModalLengthStyleEqualToSuperViewInProportion,//和父视图大小成比例关系
    LCModalLengthStyleFixedValue,//固定大小
};

#endif /* LCModalHeader_h */
