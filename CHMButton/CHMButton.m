//
//  CHMButton.m
//  fzj
//
//  Created by rex on 9/3/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "CHMButton.h"

@implementation CHMButton


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat total_w = self.bounds.size.width;
    CGFloat total_h = self.bounds.size.height;
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat image_w = self.imageView.frame.size.width;
    CGFloat image_h = self.imageView.frame.size.height;
    
    CGFloat label_w = 0.0;
    CGFloat label_h = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        label_w = self.titleLabel.intrinsicContentSize.width;
        label_h = self.titleLabel.intrinsicContentSize.height;
    } else {
        label_w = self.titleLabel.frame.size.width;
        label_h = self.titleLabel.frame.size.height;
    }
    
    switch (_btnStyle) {
        case CHMButtonStyleTop:
        {
            CGFloat image_x = (total_w - image_w) * 0.5;
            CGFloat image_y = (total_h - image_h - label_h) * 0.5;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
            CGFloat label_x = (total_w - label_w) * 0.5;
            CGFloat label_y = CGRectGetMaxY(self.imageView.frame) + self.titleEdgeInsets.top;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
        }
            break;
        case CHMButtonStyleBottom:
        {
            CGFloat label_x = (total_w - label_w) * 0.5;
            CGFloat label_y = (total_h - image_h - label_h) * 0.5;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
            
            CGFloat image_x = (total_w - image_w) * 0.5;
            CGFloat image_y =  CGRectGetMaxY(self.titleLabel.frame) + self.titleEdgeInsets.bottom;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
        }
            break;
        case CHMButtonStyleLeft:
        {
            
        }
            break;
        case CHMButtonStyleRight:
        {
            CGFloat image_x = total_w - image_w - self.imageEdgeInsets.left;
            CGFloat image_y = self.imageView.frame.origin.y;
            self.imageView.frame = CGRectMake(image_x, image_y, image_w, image_h);
            
            CGFloat label_x = image_x - label_w - self.titleEdgeInsets.left;
            CGFloat label_y = self.titleLabel.frame.origin.y;
            self.titleLabel.frame = CGRectMake(label_x, label_y, label_w, label_h);
            
        }
            break;
            
        default:
            break;
    }
}

@end
