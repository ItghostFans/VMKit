//
//  VMKProgressView.m
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import "VMKProgressView.h"

@interface VMKProgressView ()

@property (weak, nonatomic) CALayer *trackLayer;
@property (weak, nonatomic) CALayer *progressLayer;
@property (weak, nonatomic) CALayer *thumbLayer;

@end

@implementation VMKProgressView

#pragma mark - Setter

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:NO];
}

- (void)setStyle:(VMKProgressViewStyle)style {
    _style = style;
    if (_style & VMKProgressViewStyleGradientTrack) {
        _trackLayer = CALayer.layer;
        _progressLayer = CALayer.layer;
        _thumbLayer = CALayer.layer;
    } else {
        _trackLayer = CAGradientLayer.layer;
    }
    if (_style & VMKProgressViewStyleGradientProgress) {
        _progressLayer = CAGradientLayer.layer;
    }
    if (_style & VMKProgressViewStyleNormalThumb) {
        _thumbLayer = CAGradientLayer.layer;
    }
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    _progress = progress;
    [self updateProgressAnimated:animated];
}

#pragma mark - UpdateProgress

- (void)updateProgressAnimated:(BOOL)animated {
    if (animated) {
        
    } else {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [CATransaction commit];
    }
}

@end
