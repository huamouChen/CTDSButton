//
//  CHMButton.h
//  fzj
//
//  Created by rex on 9/3/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DSButtonStyle) {
    DSButtonStyleDefault = 0, // 默认，什么也不动
    DSButtonStyleTop,         // image在上，label在下
    DSButtonStyleLeft,        // image在左，label在右
    DSButtonStyleBottom,      // image在下，label在上
    DSButtonStyleRight        // image在右，label在左
};

NS_ASSUME_NONNULL_BEGIN

@interface DSButton : UIButton

/// 按钮 文字、图片 位置样式
@property (nonatomic, assign) DSButtonStyle btnStyle;

/// 文字 图片的间距，默认 7
@property (nonatomic, assign) CGFloat betweenMargin;

@end

NS_ASSUME_NONNULL_END
