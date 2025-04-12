//
//  VMKButton.m
//  
//
//  Created by ItghostFan on 2025/4/12.
//

#import "VMKButton.h"

@implementation VMKButton

#pragma mark - Super

- (void)layoutSubviews {
    [super layoutSubviews];
    [self vmk_layoutUpdate];
}

#pragma mark - Setter

- (void)setVmk_layout:(VMKButtonLayout)vmk_layout {
    if (_vmk_layout == vmk_layout) {
        return;
    }
    _vmk_layout = vmk_layout;
    [self setNeedsLayout];
}

- (void)setVmk_itemSpacing:(CGFloat)vmk_itemSpacing {
    if (_vmk_itemSpacing == vmk_itemSpacing) {
        return;
    }
    _vmk_itemSpacing = vmk_itemSpacing;
    [self setNeedsLayout];
}

#pragma mark - private

- (void)vmk_layoutUpdate {
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    CGFloat itemSpacing2 = self.vmk_itemSpacing / 2;
    switch (self.vmk_layout) {
        case VMKButtonLayoutHTitleImage: {
            // 后图前标题
            titleEdgeInsets = UIEdgeInsetsMake(
                                               0.0f,
                                               -CGRectGetWidth(self.imageView.frame) - itemSpacing2,
                                               0.0f,
                                               CGRectGetWidth(self.imageView.frame));
            imageEdgeInsets = UIEdgeInsetsMake(
                                               0.0f,
                                               CGRectGetWidth(self.titleLabel.frame) + itemSpacing2,
                                               0.0f,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutVImageTitle: {
            // 上图下标题
            titleEdgeInsets = UIEdgeInsetsMake(
                                               CGRectGetHeight(self.imageView.frame) + itemSpacing2,
                                               -CGRectGetWidth(self.imageView.frame),
                                               -itemSpacing2,
                                               0.0f);
            imageEdgeInsets = UIEdgeInsetsMake(
                                               -CGRectGetHeight(self.titleLabel.frame) - itemSpacing2,
                                               0.0f,
                                               itemSpacing2,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutVTitleImage: {
            // 下图上标题
            titleEdgeInsets = UIEdgeInsetsMake(
                                               -CGRectGetHeight(self.imageView.frame) + itemSpacing2,
                                               -CGRectGetWidth(self.imageView.frame),
                                               -itemSpacing2,
                                               0.0f);
            imageEdgeInsets = UIEdgeInsetsMake(
                                               CGRectGetHeight(self.titleLabel.frame) - itemSpacing2,
                                               0.0f,
                                               itemSpacing2,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutHImageTitle: {
            // 前图后标题
            titleEdgeInsets = UIEdgeInsetsMake(0.0f, itemSpacing2, 0.0f, -itemSpacing2);
            imageEdgeInsets = UIEdgeInsetsMake(0.0f, -itemSpacing2, 0.0f, itemSpacing2);
            break;
        }
        default: {
            break;
        }
    }
    if (!UIEdgeInsetsEqualToEdgeInsets(self.titleEdgeInsets, titleEdgeInsets)) {
        self.titleEdgeInsets = titleEdgeInsets;
    }
    if (!UIEdgeInsetsEqualToEdgeInsets(self.imageEdgeInsets, imageEdgeInsets)) {
        self.imageEdgeInsets = imageEdgeInsets;
    }
}

@end
