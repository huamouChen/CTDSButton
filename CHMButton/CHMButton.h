//
//  CHMButton.h
//  fzj
//
//  Created by rex on 9/3/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHMButtonStyle) {
    CHMButtonStyleTop = 0,     // image在上，label在下
    CHMButtonStyleLeft,        // image在左，label在右
    CHMButtonStyleBottom,      // image在下，label在上
    CHMButtonStyleRight        // image在右，label在左
};

NS_ASSUME_NONNULL_BEGIN

@interface CHMButton : UIButton

/// 按钮 文字、图片 位置样式
@property (nonatomic, assign) CHMButtonStyle btnStyle;

@end

NS_ASSUME_NONNULL_END
