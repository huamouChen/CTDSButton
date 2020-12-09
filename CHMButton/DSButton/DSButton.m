//
//  CHMButton.m
//  fzj
//
//  Created by rex on 9/3/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "DSButton.h"

@implementation DSButton


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat total_w = self.bounds.size.width;
    CGFloat total_h = self.bounds.size.height;
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat image_w = self.imageView.frame.size.width;
    CGFloat image_h = self.imageView.frame.size.height;
    
    CGFloat label_w = self.titleLabel.intrinsicContentSize.width;
    CGFloat label_h = self.titleLabel.intrinsicContentSize.height;
    
    _betweenMargin = _betweenMargin ? _betweenMargin : 7;
    
    switch (_btnStyle) {
        case DSButtonStyleTop:
        {
            CGFloat image_x = (total_w - image_w) * 0.5;
            CGFloat image_y = (total_h - image_h - label_h - _betweenMargin) * 0.5;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
            CGFloat label_x = (total_w - label_w) * 0.5;
            CGFloat label_y = CGRectGetMaxY(self.imageView.frame) + _betweenMargin;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
        }
            break;
        case DSButtonStyleBottom:
        {
            CGFloat label_x = (total_w - label_w) * 0.5;
            CGFloat label_y = (total_h - image_h - label_h - _betweenMargin) * 0.5;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
            
            CGFloat image_x = (total_w - image_w) * 0.5;
            CGFloat image_y =  CGRectGetMaxY(self.titleLabel.frame) + _betweenMargin;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
        }
            break;
        case DSButtonStyleLeft:
        {
            CGFloat image_x = 0;
            CGFloat image_y = self.imageView.frame.origin.y;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
            CGFloat label_x = CGRectGetMaxX(self.imageView.frame) + _betweenMargin;
            CGFloat label_y = self.titleLabel.frame.origin.y;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
        }
            break;
        case DSButtonStyleRight:
        {
            CGFloat label_x = total_w - image_w - label_w - _betweenMargin;
            CGFloat label_y = self.titleLabel.frame.origin.y;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
            
            CGFloat image_x = total_w - image_w;
            CGFloat image_y = self.imageView.frame.origin.y;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
        }
            break;
            
        default:
        {
            CGFloat image_x = (total_w - image_w - label_w) * 0.5;
            CGFloat image_y = self.imageView.frame.origin.y;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
            CGFloat label_x = CGRectGetMaxX(self.imageView.frame);
            CGFloat label_y = self.titleLabel.frame.origin.y;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
        }
            break;
    }
}

- (void)setBetweenMargin:(CGFloat)betweenMargin {
    _betweenMargin = betweenMargin;
    // 如果不是默认状态，刷新布局
    if (_btnStyle != DSButtonStyleDefault) {
        [self layoutIfNeeded];
    }
}

@end
