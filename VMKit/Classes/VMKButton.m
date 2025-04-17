//
//  VMKButton.m
//  
//
//  Created by ItghostFan on 2025/4/12.
//

#import "VMKButton.h"

#import <VMLocalization/UIGeometry+Localization.h>

@implementation VMKButton

#pragma mark - Super

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutUpdate];
}

- (CGSize)intrinsicContentSize {
    CGSize intrinsicContentSize = [super intrinsicContentSize];
    switch (self.layout) {
        case VMKButtonLayoutHTitleImage:
        case VMKButtonLayoutHImageTitle: {
            break;
        }
        case VMKButtonLayoutVImageTitle:
        case VMKButtonLayoutVTitleImage: {
            // 需要重新计算。
            CGSize titleSize = [self.titleLabel sizeThatFits:(CGSizeZero)];
            CGSize imageSize = self.imageView.image.size;
            intrinsicContentSize.width = MAX(titleSize.width, imageSize.width) + self.contentEdgeInsets.left + self.contentEdgeInsets.right;
            intrinsicContentSize.height = titleSize.height + imageSize.height + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
            break;
        }
        default: {
            break;
        }
    }
    return intrinsicContentSize;
}

#pragma mark - Setter

- (void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {
    if (_itemSpacing > 0.0f) {
        switch (self.layout) {
            case VMKButtonLayoutHTitleImage:
            case VMKButtonLayoutHImageTitle: {
                contentEdgeInsets.left += self.itemSpacing / 2;
                contentEdgeInsets.right += self.itemSpacing / 2;
                break;
            }
            case VMKButtonLayoutVImageTitle:
            case VMKButtonLayoutVTitleImage: {
                contentEdgeInsets.top += self.itemSpacing / 2;
                contentEdgeInsets.bottom += self.itemSpacing / 2;
                break;
            }
            default: {
                break;
            }
        }
    }
    [super setContentEdgeInsets:contentEdgeInsets];
}

- (void)setLayout:(VMKButtonLayout)layout {
    if (_layout == layout) {
        return;
    }
    _layout = layout;
    [self setNeedsLayout];
}

- (void)setItemSpacing:(CGFloat)itemSpacing {
    if (_itemSpacing == itemSpacing) {
        return;
    }
    UIEdgeInsets contentEdgeInsets = self.contentEdgeInsets;
    if (_itemSpacing > 0.0f) {  // 先恢复外部设置进来的。
        switch (self.layout) {
            case VMKButtonLayoutHTitleImage:
            case VMKButtonLayoutHImageTitle: {
                contentEdgeInsets.left -= self.itemSpacing / 2;
                contentEdgeInsets.right -= self.itemSpacing / 2;
                break;
            }
            case VMKButtonLayoutVImageTitle:
            case VMKButtonLayoutVTitleImage: {
                contentEdgeInsets.top -= self.itemSpacing / 2;
                contentEdgeInsets.bottom -= self.itemSpacing / 2;
                break;
            }
            default: {
                break;
            }
        }
    }
    _itemSpacing = itemSpacing;
    [self setContentEdgeInsets:contentEdgeInsets];
    [self setNeedsLayout];
}

#pragma mark - private

- (void)layoutUpdate {
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    CGFloat itemSpacing2 = self.itemSpacing / 2;
    switch (self.layout) {
        case VMKButtonLayoutHTitleImage: {
            // 后图前标题
            titleEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               0.0f,
                                               -CGRectGetWidth(self.imageView.frame) - itemSpacing2,
                                               0.0f,
                                               CGRectGetWidth(self.imageView.frame));
            imageEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               0.0f,
                                               CGRectGetWidth(self.titleLabel.frame) + itemSpacing2,
                                               0.0f,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutVImageTitle: {
            // 上图下标题
            titleEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               CGRectGetHeight(self.imageView.frame) + itemSpacing2,
                                               -CGRectGetWidth(self.imageView.frame),
                                               -itemSpacing2,
                                               0.0f);
            imageEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               -CGRectGetHeight(self.titleLabel.frame) - itemSpacing2,
                                               0.0f,
                                               itemSpacing2,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutVTitleImage: {
            // 下图上标题
            titleEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               -CGRectGetHeight(self.imageView.frame) - itemSpacing2,
                                               -CGRectGetWidth(self.imageView.frame),
                                               itemSpacing2,
                                               0.0f);
            imageEdgeInsets = UIDirectionalEdgesInsetsMake(
                                               CGRectGetHeight(self.titleLabel.frame) + itemSpacing2,
                                               0.0f,
                                               -itemSpacing2,
                                               -CGRectGetWidth(self.titleLabel.frame));
            break;
        }
        case VMKButtonLayoutHImageTitle: {
            // 前图后标题
            titleEdgeInsets = UIDirectionalEdgesInsetsMake(0.0f, itemSpacing2, 0.0f, -itemSpacing2);
            imageEdgeInsets = UIDirectionalEdgesInsetsMake(0.0f, -itemSpacing2, 0.0f, itemSpacing2);
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
