//
//  VMKProgressView.h
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, VMKProgressViewStyle) {
    // 默认样式，如果全圆角场景，使用CALayer.cornerRadius来做圆角，CALayer.borderColor&CALayer.borderWidth来做边框。
    // 否则使用CAShapeLayer，处理不规则填充和边框。
    VMKProgressViewStyleNone                = 0,
    // 渐变背景，只能使用CALayer.cornerRadius来做圆角，CALayer.borderColor&CALayer.borderWidth来做边框。
    VMKProgressViewStyleGradientTrack       = 1,
    // 渐变进度，只能使用CALayer.cornerRadius来做圆角，CALayer.borderColor&CALayer.borderWidth来做边框。
    VMKProgressViewStyleGradientProgress    = 1 << 1,
    // 默认Thumb，如果全圆角场景，使用CALayer.cornerRadius来做圆角，CALayer.borderColor&CALayer.borderWidth来做边框。
    // 否则使用CAShapeLayer，处理不规则填充和边框。
    VMKProgressViewStyleNormalThumb         = 1 << 2,   // 有Thumb
    // 渐变Thumb，只能使用CALayer.cornerRadius来做圆角，CALayer.borderColor&CALayer.borderWidth来做边框。
    VMKProgressViewStyleGradientThumb       = 1 << 3,   // 渐变Thumb
    // 只有这个标志的时候，zeroProgressWidth才有意义
    VMKProgressViewStyleZeroProgress        = 1 << 4,   // 进度为0照样显示进度条
};

@interface VMKProgressView : UIView

@property (assign, nonatomic) CGFloat progress;

@property (assign, nonatomic, readonly) VMKProgressViewStyle style;
// VMKProgressViewStyleZeroProgress
@property (assign, nonatomic) CGFloat zeroProgressWidth;                // 进度为0.0时的进度条宽度
// VMKProgressViewStyleGradientTrack
@property (assign, nonatomic) CGPoint trackStartPoint;
@property (assign, nonatomic) CGPoint trackEndPoint;
@property (strong, nonatomic, nullable) NSArray<__kindof NSNumber *> *trackLocations;
@property (strong, nonatomic, nullable) NSArray *trackColors;
@property (strong, nonatomic, nullable) CAGradientLayerType trackType;
// VMKProgressViewStyleGradientProgress
@property (assign, nonatomic) CGPoint progressStartPoint;
@property (assign, nonatomic) CGPoint progressEndPoint;
@property (strong, nonatomic, nullable) NSArray<__kindof NSNumber *> *progressLocations;
@property (strong, nonatomic, nullable) NSArray *progressColors;
@property (strong, nonatomic, nullable) CAGradientLayerType progressType;
//VMKProgressViewStyleNormalThumb
@property (assign, nonatomic) UIRectCorner thumbCorner;                 // 圆角，因为会有这种场景。
@property (assign, nonatomic) CGSize thumbCornerRadius;                 // Thumb圆角
@property (assign, nonatomic) CGFloat thumbBorderWidth;                 // Thumb边框宽
@property (strong, nonatomic, nullable) UIColor *thumbBorderColor;      // Thumb边框色
@property (strong, nonatomic, nullable) UIColor *thumbColor;            // Thumb背景色
// VMKProgressViewStyleGradientThumb
@property (assign, nonatomic) CGPoint thumbStartPoint;
@property (assign, nonatomic) CGPoint thumbEndPoint;
@property (strong, nonatomic, nullable) NSArray<__kindof NSNumber *> *thumbLocations;
@property (strong, nonatomic, nullable) NSArray *thumbColors;
@property (strong, nonatomic, nullable) CAGradientLayerType thumbType;
// VMKProgressViewStyleNone
@property (strong, nonatomic, nullable) UIColor *trackColor;
@property (strong, nonatomic, nullable) UIColor *progressColor;
// 通用的样式
@property (strong, nonatomic, nullable) UIColor *trackBorderColor;      // 背景边框颜色
@property (assign, nonatomic) CGFloat trackBorderWidth;                 // 背景边宽
@property (strong, nonatomic, nullable) UIColor *progressBorderColor;   // 进度条边框颜色
@property (assign, nonatomic) CGFloat progressBorderWidth;              // 进度条边宽
@property (assign, nonatomic) UIRectCorner trackCorner;                 // 背景圆角
@property (assign, nonatomic) CGSize trackCornerRadius;                 // 背景圆角
@property (assign, nonatomic) UIRectCorner progressCorner;              // 进度条圆角
@property (assign, nonatomic) CGSize progressCornerRadius;              // 进度条圆角
@property (strong, nonatomic, nullable) UIColor *trackShadowColor;      // 背景阴影
@property (assign, nonatomic) CGSize trackShadowOffset;                 // 背景阴影
@property (assign, nonatomic) CGFloat trackShadowOpacity;               // 背景阴影
@property (assign, nonatomic) UIEdgeInsets contentInsets;               // view跟track的边距
@property (assign, nonatomic) UIEdgeInsets trackInsets;                 // 背景边距

- (instancetype)initWithStyle:(VMKProgressViewStyle)style;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
