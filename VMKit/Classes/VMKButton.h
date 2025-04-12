//
//  VMKButton.h
//  
//
//  Created by ItghostFan on 2025/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, VMKButtonLayout) {
    /// 需要对应增加contentEdgeInsets的left+(vmk_itemSpacing/2)，right+(vmk_itemSpacing/2)
    VMKButtonLayoutHImageTitle,  // 前图后标题
    VMKButtonLayoutHTitleImage,  // 后图前标题
    /// 需要对应增加contentEdgeInsets的top+(vmk_itemSpacing/2)，bottom+(vmk_itemSpacing/2)
    VMKButtonLayoutVImageTitle,  // 上图下标题
    VMKButtonLayoutVTitleImage,  // 下图上标题
};

@interface VMKButton : UIButton

@property (assign, nonatomic) VMKButtonLayout vmk_layout;
@property (assign, nonatomic) CGFloat vmk_itemSpacing;

@end

NS_ASSUME_NONNULL_END
