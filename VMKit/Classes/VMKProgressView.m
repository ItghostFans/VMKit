//
//  VMKProgressView.m
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import "VMKProgressView.h"

#import <VMLocalization/UIGeometry+Localization.h>

@interface VMKProgressView ()

// 可能是CAShapeLayer\CAGradientLayer，由对应corner&radius&style决定
@property (weak, nonatomic) CALayer *trackLayer;
@property (weak, nonatomic) CALayer *progressLayer;
@property (weak, nonatomic) CALayer *thumbLayer;

@end

@implementation VMKProgressView

- (instancetype)initWithStyle:(VMKProgressViewStyle)style {
    if (self = [super initWithFrame:(CGRectZero)]) {
        self.style = style;
        _trackCorner = UIRectCornerAllCorners;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateProgressAnimated:NO];
}

#pragma mark - Private

- (CALayer *)createShapeLayer {
    CAShapeLayer *layer = CAShapeLayer.layer;
    [self.layer addSublayer:layer];
    return layer;
}

- (CAGradientLayer *)createGradientLayer {
    CAGradientLayer *layer = CAGradientLayer.layer;
    [self.layer addSublayer:layer];
    return layer;
}

#pragma mark - Setter

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    _progress = progress;
    [self updateProgressAnimated:animated];
}

- (void)setStyle:(VMKProgressViewStyle)style {
    // 这里按默认4个角，半径为0处理。
    _style = style;
    if (_style & VMKProgressViewStyleGradientTrack) {
        _trackLayer = [self createGradientLayer];
    } else {
        _trackLayer = [self createShapeLayer];
        self.trackColor = UIColor.grayColor;
    }
    if (_style & VMKProgressViewStyleGradientProgress) {
        _progressLayer = [self createGradientLayer];
    } else {
        _progressLayer = [self createShapeLayer];
        self.progressColor = UIColor.systemBlueColor;
    }
    if (_style & VMKProgressViewStyleNormalThumb) {
        _thumbLayer = [self createShapeLayer];
        _thumbColor = UISlider.appearance.thumbTintColor;
    } else
    if (_style & VMKProgressViewStyleGradientThumb) {
        _thumbLayer = [self createGradientLayer];
    }
}

#pragma mark - VMKProgressViewStyleNormalThumb

- (void)setThumbCorner:(UIRectCorner)thumbCorner {
    _thumbCorner = thumbCorner;
    if ([_thumbLayer isKindOfClass:CAShapeLayer.class]) {
       [self updateProgressAnimated:NO];
   }
}

- (void)setThumbCornerRadius:(CGSize)thumbCornerRadius {
    _thumbCornerRadius = thumbCornerRadius;
    if ([_thumbLayer isKindOfClass:CAGradientLayer.class]) {
        _thumbLayer.cornerRadius = _thumbCornerRadius.width;
    } else {
        [self updateProgressAnimated:NO];
    }
}

- (void)setThumbBorderWidth:(CGFloat)thumbBorderWidth {
    _thumbBorderWidth = thumbBorderWidth;
    if ([_thumbLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_thumbLayer setLineWidth:_thumbBorderWidth];
    } else {
        _thumbLayer.borderWidth = _thumbBorderWidth;
    }
}
- (void)setThumbBorderColor:(UIColor *)thumbBorderColor {
    _thumbBorderColor = thumbBorderColor;
    if ([_thumbLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_thumbLayer setBorderColor:_thumbBorderColor.CGColor];
    } else {
        _thumbLayer.borderColor = _thumbBorderColor.CGColor;
    }
}

- (void)setThumbColor:(UIColor *)thumbColor {
    _thumbBorderColor = thumbColor;
    if ([_thumbLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_thumbLayer setBorderColor:_thumbBorderColor.CGColor];
    } else {
        _thumbLayer.borderColor = _thumbBorderColor.CGColor;
    }
}

#pragma mark - VMKProgressViewStyleNone

- (void)setTrackColor:(UIColor *)trackColor {
    _trackColor = trackColor;
    if ([_trackLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_trackLayer setFillColor:_trackColor.CGColor];
    } else {
//        NSAssert(NO, @"Gradient Track Not Support trackColor!");
    }
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    if ([_progressLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_progressLayer setFillColor:_progressColor.CGColor];
    } else {
//        NSAssert(NO, @"Gradient Progress Not Support progressColor!");
    }
}

#pragma mark - 通用的样式

- (void)setTrackBorderColor:(UIColor *)trackBorderColor {
    _trackBorderColor = trackBorderColor;
    if ([_trackLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_trackLayer setBorderColor:_trackBorderColor.CGColor];
    } else {
        _trackLayer.borderColor = _trackBorderColor.CGColor;
    }
}

- (void)setTrackBorderWidth:(CGFloat)trackBorderWidth {
    _trackBorderWidth = trackBorderWidth;
    if ([_trackLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_trackLayer setLineWidth:_trackBorderWidth];
    } else {
        _trackLayer.borderWidth = _trackBorderWidth;
    }
}

- (void)setProgressBorderColor:(UIColor *)progressBorderColor {
    _progressBorderColor = progressBorderColor;
    if ([_trackLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_progressLayer setBorderColor:_progressBorderColor.CGColor];
    } else {
        _progressLayer.borderColor = _progressBorderColor.CGColor;
    }
}

- (void)setProgressBorderWidth:(CGFloat)progressBorderWidth {
    _progressBorderWidth = progressBorderWidth;
    if ([_progressLayer isKindOfClass:CAShapeLayer.class]) {
        [(CAShapeLayer *)_progressLayer setLineWidth:_progressBorderWidth];
    } else {
        _progressLayer.borderWidth = _progressBorderWidth;
    }
}

- (void)setTrackCorner:(UIRectCorner)trackCorner {
    _trackCorner = trackCorner;
    if ([_trackLayer isKindOfClass:CAShapeLayer.class]) {
       [self updateProgressAnimated:NO];
   }
}

- (void)setTrackCornerRadius:(CGSize)trackCornerRadius {
    _trackCornerRadius = trackCornerRadius;
    if ([_trackLayer isKindOfClass:CAGradientLayer.class]) {
        _trackLayer.cornerRadius = _trackCornerRadius.width;
    } else {
        [self updateProgressAnimated:NO];
    }
}

- (void)setProgressCorner:(UIRectCorner)progressCorner {
    _progressCorner = progressCorner;
    if ([_progressLayer isKindOfClass:CAShapeLayer.class]) {
       [self updateProgressAnimated:NO];
   }
}

- (void)setProgressCornerRadius:(CGSize)progressCornerRadius {
    _progressCornerRadius = progressCornerRadius;
    if ([_progressLayer isKindOfClass:CAGradientLayer.class]) {
        _progressLayer.cornerRadius = _trackCornerRadius.width;
    } else {
        [self updateProgressAnimated:NO];
    }
}

- (void)setTrackShadowColor:(UIColor *)trackShadowColor {
    _trackShadowColor = trackShadowColor;
    self.trackLayer.shadowColor = _trackShadowColor.CGColor;
}

- (void)setTrackShadowOffset:(CGSize)trackShadowOffset {
    _trackShadowOffset = trackShadowOffset;
    self.trackLayer.shadowOffset = _trackShadowOffset;
}

- (void)setTrackShadowOpacity:(CGFloat)trackShadowOpacity {
    _trackShadowOpacity = trackShadowOpacity;
    self.trackLayer.shadowOpacity = _trackShadowOpacity;
}

#pragma mark - Update Track Layer

//- (void)updateLayerCorner:(UIRectCorner)corner
//             cornerRadius:(CGSize)cornerRadius
//                fromLayer:(CALayer *)layer
//                  toLayer:(void(^)(CALayer *layer))toLayer {
//    if (corner & UIRectCornerTopLeft &&
//        corner & UIRectCornerTopRight &&
//        corner & UIRectCornerBottomRight &&
//        corner & UIRectCornerBottomLeft) {
//        if ([layer isKindOfClass:CAShapeLayer.class]) {
//            
//        }
//    } else {
//        if (CGSizeEqualToSize(cornerRadius, CGSizeZero)) {
//        } else {
//            [self updateProgressAnimated:NO];
//        }
//    }
//}

- (void)updateShapeLayer:(CAShapeLayer *)layer
                 corners:(UIRectCorner)corners
            cornerRadius:(CGSize)cornerRadius
                   color:(UIColor *)color
             borderColor:(UIColor *)borderColor
             borderWidth:(CGFloat)borderWidth {
    if (![layer isKindOfClass:CAShapeLayer.class]) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds byRoundingCorners:corners cornerRadii:cornerRadius];
    path.flatness = 0.1f;
    layer.path = path.CGPath;
    layer.fillColor = color.CGColor;
    layer.strokeColor = borderColor.CGColor;
    path.lineWidth = borderWidth;
}

#pragma mark - UpdateProgress

- (void)updateProgressAnimated:(BOOL)animated {
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (width <= 0.0f || height <= 0.0) {   // 防止除数异常
        return;
    }
    
    // 背景的区域
    _trackLayer.frame = UIRectFlip(UIEdgeInsetsInsetRect(self.bounds, _contentInsets), self.bounds);
    if (CGRectIsNull(self.trackLayer.frame)) {
        return;
    }
    [self updateShapeLayer:(CAShapeLayer *)_trackLayer corners:_trackCorner cornerRadius:_trackCornerRadius color:_trackColor borderColor:_trackBorderColor borderWidth:_trackBorderWidth];
    
    // 进度条的区域（初算）
    CGRect progressFrame = UIEdgeInsetsInsetRect(_trackLayer.frame, _trackInsets);
    if (CGRectIsNull(progressFrame)) {
        return;
    }
    
    // 百分比区域
    CGRect percentFrame = progressFrame;
    if (_style & VMKProgressViewStyleZeroProgress) {
        percentFrame = CGRectOffset(percentFrame, _zeroProgressWidth, 0.0f);
        percentFrame.size.width -= _zeroProgressWidth;
    }
    
    if (CGRectIsNull(percentFrame)) {
        return;
    }
    // 进度条的区域（核算）
    progressFrame.size.width = CGRectGetMinX(percentFrame) - CGRectGetMinX(progressFrame) + (self.progress * CGRectGetWidth(percentFrame));
    
    CGRect thumbFrame = CGRectMake(CGRectGetMaxX(progressFrame) - height, 0.0f, height, height);
    
    if (animated) {
        _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
        [self updateShapeLayer:(CAShapeLayer *)_progressLayer corners:_progressCorner cornerRadius:_progressCornerRadius color:_progressColor borderColor:_progressBorderColor borderWidth:_progressBorderWidth];
        _thumbLayer.frame = UIRectFlip(thumbFrame, self.bounds);
        [self updateShapeLayer:(CAShapeLayer *)_thumbLayer corners:_thumbCorner cornerRadius:_thumbCornerRadius color:_thumbColor borderColor:_thumbBorderColor borderWidth:_thumbBorderWidth];
    } else {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
        [self updateShapeLayer:(CAShapeLayer *)_progressLayer corners:_progressCorner cornerRadius:_progressCornerRadius color:_progressColor borderColor:_progressBorderColor borderWidth:_progressBorderWidth];
        _thumbLayer.frame = UIRectFlip(thumbFrame, self.bounds);
        [self updateShapeLayer:(CAShapeLayer *)_thumbLayer corners:_thumbCorner cornerRadius:_thumbCornerRadius color:_thumbColor borderColor:_thumbBorderColor borderWidth:_thumbBorderWidth];
        [CATransaction commit];
    }
}

@end
