//
//  VMKProgressView.m
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import "VMKProgressView.h"

#import <VMLocalization/UIGeometry+Localization.h>

@interface VMKProgressView ()

@property (weak, nonatomic) CALayer *trackLayer;
@property (weak, nonatomic) CALayer *progressLayer;
@property (weak, nonatomic) CALayer *thumbLayer;

@property (weak, nonatomic) CAShapeLayer *trackMaskLayer;
@property (weak, nonatomic) CAShapeLayer *progressMaskLayer;

@end

@implementation VMKProgressView

- (instancetype)initWithStyle:(VMKProgressViewStyle)style {
    if (self = [super initWithFrame:(CGRectZero)]) {
        self.style = style;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateProgressAnimated:NO];
}

#pragma mark - Private

- (CALayer *)createLayer {
    CALayer *layer = CALayer.layer;
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
    _style = style;
    if (_style & VMKProgressViewStyleGradientTrack) {
        _trackLayer = [self createGradientLayer];
    } else {
        _trackLayer = [self createLayer];
        self.trackColor = UIColor.grayColor;
    }
    if (_style & VMKProgressViewStyleGradientProgress) {
        _progressLayer = [self createGradientLayer];
    } else {
        _progressLayer = [self createLayer];
        self.progressColor = UIColor.systemBlueColor;
    }
    if (_style & VMKProgressViewStyleNormalThumb) {
        _thumbLayer = [self createLayer];
        _thumbColor = UISlider.appearance.thumbTintColor;
    } else
    if (_style & VMKProgressViewStyleGradientThumb) {
        _thumbLayer = [self createGradientLayer];
    }
}

- (void)setTrackColor:(UIColor *)trackColor {
    _trackColor = trackColor;
    if ([_trackLayer isKindOfClass:CALayer.class]) {
        _trackLayer.backgroundColor = _trackColor.CGColor;
    }
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    if ([_progressLayer isKindOfClass:CALayer.class]) {
        _progressLayer.backgroundColor = _progressColor.CGColor;
    }
}

- (void)setTrackBorderColor:(UIColor *)trackBorderColor {
    _trackBorderColor = trackBorderColor;
    _trackLayer.borderColor = _trackBorderColor.CGColor;
}

- (void)setTrackBorderWidth:(CGFloat)trackBorderWidth {
    _trackBorderWidth = trackBorderWidth;
    _trackLayer.borderWidth = _trackBorderWidth;
}

- (void)setCorner:(UIRectCorner)corner {
    _corner = corner;
    if (_corner & UIRectCornerTopLeft &&
        _corner & UIRectCornerTopRight &&
        _corner & UIRectCornerBottomRight &&
        _corner & UIRectCornerBottomLeft) {
        self.trackMaskLayer.mask = nil;
        self.trackMaskLayer.cornerRadius = _trackCornerRadius.width;
        self.progressLayer.mask = nil;
        self.progressLayer.cornerRadius = _progressCornerRadius.width;
        [self updateProgressAnimated:NO];
    } else {
        if (CGSizeEqualToSize(_trackCornerRadius, CGSizeZero)) {
            self.trackMaskLayer.mask = nil;
            self.trackMaskLayer.cornerRadius = 0.0f;
        } else {
            CAShapeLayer *trackMaskLayer = CAShapeLayer.new;
            self.trackLayer.mask = trackMaskLayer;
            self.trackMaskLayer = trackMaskLayer;
            [self updateProgressAnimated:NO];
        }
        if (CGSizeEqualToSize(_progressCornerRadius, CGSizeZero)) {
            self.progressLayer.mask = nil;
            self.progressLayer.cornerRadius = 0.0f;
        } else {
            CAShapeLayer *progressMaskLayer = CAShapeLayer.new;
            self.progressLayer.mask = progressMaskLayer;
            self.progressMaskLayer = progressMaskLayer;
            [self updateProgressAnimated:NO];
        }
    }
}

- (void)setTrackCornerRadius:(CGSize)trackCornerRadius {
    _trackCornerRadius = trackCornerRadius;
    if (_corner & UIRectCornerTopLeft &&
        _corner & UIRectCornerTopRight &&
        _corner & UIRectCornerBottomRight &&
        _corner & UIRectCornerBottomLeft) {
        self.trackMaskLayer.mask = nil;
        self.trackMaskLayer.cornerRadius = _trackCornerRadius.width;
    } else {
        if (CGSizeEqualToSize(_trackCornerRadius, CGSizeZero)) {
            self.trackMaskLayer.mask = nil;
            self.trackMaskLayer.cornerRadius = 0.0f;
        } else {
            CAShapeLayer *trackMaskLayer = CAShapeLayer.new;
            self.trackLayer.mask = trackMaskLayer;
            self.trackMaskLayer = trackMaskLayer;
            [self updateProgressAnimated:NO];
        }
    }
}

- (void)setProgressCornerRadius:(CGSize)progressCornerRadius {
    _progressCornerRadius = progressCornerRadius;
    if (_corner & UIRectCornerTopLeft &&
        _corner & UIRectCornerTopRight &&
        _corner & UIRectCornerBottomRight &&
        _corner & UIRectCornerBottomLeft) {
        self.progressLayer.mask = nil;
        self.progressLayer.cornerRadius = _progressCornerRadius.width;
    } else {
        if (CGSizeEqualToSize(_progressCornerRadius, CGSizeZero)) {
            self.progressLayer.mask = nil;
            self.progressLayer.cornerRadius = 0.0f;
        } else {
            CAShapeLayer *progressMaskLayer = CAShapeLayer.new;
            self.progressLayer.mask = progressMaskLayer;
            self.progressMaskLayer = progressMaskLayer;
            [self updateProgressAnimated:NO];
        }
    }
}

- (void)setProgressBorderWidth:(CGFloat)progressBorderWidth {
    _progressBorderWidth = progressBorderWidth;
    self.progressLayer.borderWidth = _progressBorderWidth;
}

- (void)setProgressBorderColor:(UIColor *)progressBorderColor {
    _progressBorderColor = progressBorderColor;
    self.progressLayer.borderColor = _progressBorderColor.CGColor;
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

#pragma mark - UpdateCorners

#pragma mark - UpdateProgress

- (void)updateProgressAnimated:(BOOL)animated {
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (width <= 0.0f || height <= 0.0) {   // 防止除数异常
        return;
    }
    
    // 背景的区域
    _trackLayer.frame = UIRectFlip(UIEdgeInsetsInsetRect(self.bounds, _contentInsets), self.bounds);
//    _trackMaskLayer.path = [UIBezierPath bezierPathWithRoundedRect:_trackLayer.bounds byRoundingCorners:_corner cornerRadii:_trackCornerRadius].CGPath;
    _trackMaskLayer.path = [UIBezierPath bezierPathWithRect:_trackLayer.bounds].CGPath;
    if (CGRectIsNull(self.trackLayer.frame)) {
        return;
    }
    
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
    progressFrame.size.width = CGRectGetMinX(progressFrame) + _zeroProgressWidth + (self.progress * CGRectGetWidth(percentFrame));
    
    if (animated) {
        _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
    } else {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
        [CATransaction commit];
    }
//    _progressMaskLayer.path = [UIBezierPath bezierPathWithRoundedRect:_progressLayer.bounds byRoundingCorners:_corner cornerRadii:_progressCornerRadius].CGPath;
    _progressMaskLayer.path = [UIBezierPath bezierPathWithRect:_progressLayer.bounds].CGPath;
}

@end
