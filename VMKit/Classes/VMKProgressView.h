//
//  VMKProgressView.h
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, VMKProgressViewStyle) {
    VMKProgressViewStyleNone                = 0,
    VMKProgressViewStyleGradientTrack       = 1,        // 渐变背景
    VMKProgressViewStyleGradientProgress    = 1 << 1,   // 渐变进度
    VMKProgressViewStyleNormalThumb         = 1 << 2,   // 有Thumb
    VMKProgressViewStyleGradientThumb       = 1 << 3,   // 渐变Thumb
    VMKProgressViewStyleZeroProgress        = 1 << 4,   // 进度为0照样显示进度条
};

@interface VMKProgressView : UIView

@property (assign, nonatomic) CGFloat progress;

@property (assign, nonatomic, readonly) VMKProgressViewStyle style;
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
@property (assign, nonatomic) CGSize thumbCornerRadius;                 // Thumb圆角
@property (assign, nonatomic) CGFloat thumbBorderWidth;                 // Thumb边框宽
@property (strong, nonatomic, nullable) UIColor *thumbBorderColor;      // Thumb边框色
@property (strong, nonatomic, nullable) UIColor *thumbColor;            // Thumb背景色
@property (assign, nonatomic) UIEdgeInsets progressInsets;              // 进度条边距
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
@property (strong, nonatomic, nullable) UIColor *progressBorderColor;   // 进度条边框颜色
@property (strong, nonatomic, nullable) UIColor *trackShadowColor;      // 背景阴影
@property (assign, nonatomic) CGFloat trackBorderWidth;                 // 背景边宽
@property (assign, nonatomic) CGSize trackCornerRadius;                 // 背景圆角
@property (assign, nonatomic) CGSize progressCornerRadius;              // 进度条圆角
@property (assign, nonatomic) UIRectCorner corner;                      // 圆角
@property (assign, nonatomic) CGFloat progressBorderWidth;              // 进度条边宽
@property (assign, nonatomic) CGSize trackShadowOffset;                 // 背景阴影
@property (assign, nonatomic) CGFloat trackShadowOpacity;               // 背景阴影
@property (assign, nonatomic) UIEdgeInsets trackInsets;                 // 背景边距
@property (assign, nonatomic) CGFloat zeroProgressWidth;                // 进度为0.0时的进度条宽度
@property (assign, nonatomic) UIEdgeInsets contentInsets;               // view跟track的边距

- (instancetype)initWithStyle:(VMKProgressViewStyle)style;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
