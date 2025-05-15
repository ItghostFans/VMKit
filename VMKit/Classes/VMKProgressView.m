//
//  VMKProgressView.m
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import "VMKProgressView.h"

#import <VMLocalization/UIGeometry+Localization.h>

@interface VMKProgressView ()
@property (weak, nonatomic) UIView *trackView;
@property (weak, nonatomic) CALayer *trackLayer;

@property (assign, nonatomic) CGRect progressFrame0;    // 进度条设置进来的Frame，认为是0值Frame。

@property (weak, nonatomic) UIView *progressView;
@property (weak, nonatomic) CALayer *progressLayer;

@property (weak, nonatomic) UIView *thumbView;
@property (weak, nonatomic) CALayer *thumbLayer;
@end

@implementation VMKProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:(CGRectZero)]) {
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    if (isnan(progress)) {
        progress = 0.0f;
    }
    _progress = progress;
    [self updateProgressAnimated:animated];
}

- (void)setSource:(id<VMKProgressViewSource>)source {
    _source = source;
    if ([_source respondsToSelector:@selector(trackViewOfProgressView:)]) {
        UIView *view = [_source trackViewOfProgressView:self];
        [self addSubview:view];
        _trackView = view;
    } else
    if ([_source respondsToSelector:@selector(trackLayerOfProgressView:)]) {
        CALayer *layer = [_source trackLayerOfProgressView:self];
        [self.layer addSublayer:layer];
        _trackLayer = layer;
    }
    
    if ([_source respondsToSelector:@selector(progressViewOfProgressView:)]) {
        UIView *view = [_source progressViewOfProgressView:self];
        [self addSubview:view];
        _progressView = view;
        _progressFrame0 = CGRectMake(0.0f, 0.0f, CGRectGetWidth(_progressView.frame), CGRectGetHeight(_progressView.frame));
    } else
    if ([_source respondsToSelector:@selector(progressLayerOfProgressView:)]) {
        CALayer *layer = [_source progressLayerOfProgressView:self];
        [self.layer addSublayer:layer];
        _progressLayer = layer;
        _progressFrame0 = CGRectMake(0.0f, 0.0f, CGRectGetWidth(_progressLayer.frame), CGRectGetHeight(_progressLayer.frame));
    }
    
    if ([_source respondsToSelector:@selector(thumbViewOfProgressView:)]) {
        UIView *view = [_source thumbViewOfProgressView:self];
        [self addSubview:view];
        _thumbView = view;
    } else
    if ([_source respondsToSelector:@selector(thumbLayerOfProgressView:)]) {
        CALayer *layer = [_source thumbLayerOfProgressView:self];
        [self.layer addSublayer:layer];
        _thumbLayer = layer;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateProgressAnimated:NO];
}

#pragma mark - Private

- (CAGradientLayer *)createGradientLayer {
    CAGradientLayer *layer = CAGradientLayer.layer;
    [self.layer addSublayer:layer];
    return layer;
}

#pragma mark - UpdateProgress

- (void)updateProgressAnimated:(BOOL)animated {
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (width <= 0.0f || height <= 0.0) {   // 防止除数异常
        return;
    }
    
    // 背景的区域
    CGRect trackFrame = UIRectFlip(UIEdgeInsetsInsetRect(self.bounds, _contentInsets), self.bounds);
    if (_trackView) {
        _trackView.frame = trackFrame;
    } else {
        _trackLayer.frame = trackFrame;
    }
    
    // 进度条的区域（初算）
    CGRect progressFrame = UIEdgeInsetsInsetRect(trackFrame, _trackInsets);
    if (CGRectIsNull(progressFrame)) {
        return;
    }
    
    // 百分比区域
    if (_thumbView) {
        progressFrame = CGRectOffset(progressFrame, CGRectGetWidth(_progressFrame0), 0.0f);
        progressFrame.size.width -= CGRectGetWidth(_progressFrame0); // (CGRectGetWidth(_thumbLayer.frame) / 2) +
    } else {
        progressFrame = CGRectOffset(progressFrame, CGRectGetWidth(_progressFrame0), 0.0f);
        progressFrame.size.width -= CGRectGetWidth(_progressFrame0); // (CGRectGetWidth(_thumbLayer.frame) / 2) +
    }
    
    if (CGRectIsNull(progressFrame)) {
        return;
    }
    // 进度条的区域（核算）
    progressFrame.size.width = CGRectGetWidth(_progressFrame0) + (self.progress * CGRectGetWidth(progressFrame));
    progressFrame.origin.x = CGRectGetMinX(progressFrame) - CGRectGetWidth(_progressFrame0);
    
    CGRect thumbFrame = _thumbView ? _thumbView.frame : _thumbLayer.frame;
    thumbFrame = CGRectMake(CGRectGetMaxX(progressFrame) - (CGRectGetWidth(thumbFrame) / 2), 0.0f, CGRectGetWidth(thumbFrame), CGRectGetHeight(thumbFrame));
    
    if (animated) {
        if (_progressView) {
            _progressView.frame = UIRectFlip(progressFrame, self.bounds);
        } else {
            _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
        }
        if (_thumbView) {
            _thumbView.frame = UIRectFlip(thumbFrame, self.bounds);
        } else {
            _thumbLayer.frame = UIRectFlip(thumbFrame, self.bounds);
        }
    } else {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        if (_progressView) {
            _progressView.frame = UIRectFlip(progressFrame, self.bounds);
        } else {
            _progressLayer.frame = UIRectFlip(progressFrame, self.bounds);
        }
        if (_thumbView) {
            _thumbView.frame = UIRectFlip(thumbFrame, self.bounds);
        } else {
            _thumbLayer.frame = UIRectFlip(thumbFrame, self.bounds);
        }
        [CATransaction commit];
    }
}

@end
