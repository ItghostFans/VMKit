//
//  VMKDemoProgressViewTableViewModelCell.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/21.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoProgressViewTableViewModelCell.h"
#import "VMKDemoProgressViewTableCellViewModel.h"

#import <VMKit/VMKProgressView.h>
#import <Masonry/Masonry.h>
#import <VMOS/VMOSShapeGradientLayer.h>
#import <VMOS/VMOSResizableLayer.h>

@interface VMKDemoProgressViewTableViewModelCell () <VMKProgressViewSource>
@property (weak, nonatomic) VMKProgressView *normalProgress;
@property (weak, nonatomic) VMKProgressView *bkgProgress;
@end

@implementation VMKDemoProgressViewTableViewModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.normalProgress.progress = 0.3f;
        self.bkgProgress.progress = 0.0f;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.normalProgress setProgress:1.0f animated:YES];
        });
        
//        CAShapeLayer *layer = CAShapeLayer.new;
//        layer.borderColor = UIColor.redColor.CGColor;
//        layer.borderWidth = 1;
//        layer.cornerRadius = 20.0f;
//        layer.backgroundColor = UIColor.greenColor.CGColor;
//        layer.frame = CGRectMake(20.0f, 20.0f, 50.0f, 50.0f);
//        [self.contentView.layer addSublayer:layer];
//        
//        VMOSShapeGradientLayer *shapeGradient = VMOSShapeGradientLayer.new;
//        shapeGradient.backgroundColor = UIColor.orangeColor.CGColor;
//        shapeGradient.frame = CGRectMake(70.0f, 70.0f, 30.0f, 30.0f);
//        shapeGradient.cornerRadius = 15.0f;
////        UIBezierPath *path = [UIBezierPath bezierPathWithRect:(CGRectMake(0.0f, 0.0f, 30.0f, 30.0f))];
////        path.lineWidth = 1.0;
//        shapeGradient.strokeColor = UIColor.redColor.CGColor;
//        shapeGradient.fillColor = UIColor.systemYellowColor.CGColor;
////        shapeGradient.path = path.CGPath;
//        [self.contentView.layer addSublayer:shapeGradient];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            shapeGradient.frame = CGRectMake(70.0f, 70.0f, 230.0f, 30.0f);
//        });
//        
//        VMOSResizableLayer *resizableLayer = VMOSResizableLayer.new;
//        [resizableLayer addCorner:(UIRectCornerTopLeft) controlPoint:CGPointMake(0.0f, 0.0f)];
//        resizableLayer.resizeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 20.0f, 20.0f);
//        resizableLayer.frame = CGRectMake(70.0f, 100.0f, 40.0f, 40.0f);
//        [self.contentView.layer addSublayer:resizableLayer];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            resizableLayer.frame = CGRectMake(70.0f, 100.0f, 100.0f, 100.0f);
//        });
//        
//        CALayer *imageLayer = CALayer.new;
//        imageLayer.contents = (__bridge id)[[UIImage imageNamed:@"bkg"] resizableImageWithCapInsets:(UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f))].CGImage;
//        imageLayer.contentsGravity = kCAGravityResize;
//        [self.contentView.layer addSublayer:imageLayer];
//        imageLayer.frame = CGRectMake(70.0f, 130.0f, 30.0f, 30.0f);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            imageLayer.frame = CGRectMake(70.0f, 130.0f, 100.0f, 100.0f);
//        });
    }
    return self;
}

- (void)setViewModel:(VMKDemoProgressViewTableCellViewModel *)viewModel {
    BOOL same = self.viewModel == viewModel;
    [super setViewModel:viewModel];
    if (same) {
        // 防止这里不必要的UI刷新。
        return;
    }
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - Private

#pragma mark - Getter

- (VMKProgressView *)normalProgress {
//    return nil;
    if (_normalProgress) {
        return _normalProgress;
    }
    VMKProgressView *normalProgress = VMKProgressView.new;
    _normalProgress = normalProgress;
    _normalProgress.source = self;
    [self.contentView addSubview:_normalProgress];
    [_normalProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(5.0f);
        make.trailing.equalTo(self.contentView).offset(-5.0f);
        make.top.equalTo(self.contentView).offset(5.0f);
        make.height.mas_equalTo(10.0f);
    }];
    return normalProgress;
}

- (VMKProgressView *)bkgProgress {
    if (_bkgProgress) {
        return _bkgProgress;
    }
    VMKProgressView *bkgProgress = VMKProgressView.new;
    _bkgProgress = bkgProgress;
    
//    _bkgProgress.thumbBorderColor = UIColor.redColor;
//    _bkgProgress.thumbColor = UIColor.whiteColor;
//    _bkgProgress.thumbBorderWidth = 1.0f;
//    
//    _bkgProgress.trackBorderWidth = 0.5f;                 // 背景边宽
//    _bkgProgress.trackBorderColor = UIColor.redColor;     // 背景边框颜色
//    _bkgProgress.trackCornerRadius = CGSizeMake(10.0f, 20.0f);                 // 背景圆角
//    _bkgProgress.progressCornerRadius = CGSizeMake(7.0f, 7.0f);              // 进度条圆角
//    _bkgProgress.trackCorner = UIRectCornerTopRight | UIRectCornerBottomRight;                      // 圆角
//    _bkgProgress.progressCorner = UIRectCornerTopRight | UIRectCornerBottomRight;                      // 圆角
//    _bkgProgress.progressBorderWidth = 1.0f;              // 进度条边宽
//    _bkgProgress.progressBorderColor = UIColor.brownColor;   // 进度条边框颜色
//    _bkgProgress.trackShadowColor = UIColor.blackColor;      // 背景阴影
//    _bkgProgress.trackShadowOffset = CGSizeMake(0, 1.0);                 // 背景阴影
//    _bkgProgress.trackShadowOpacity = 0.8f;               // 背景阴影
//    _bkgProgress.zeroProgressWidth = 30.0f;                // 进度为0.0时的进度条宽度
    _bkgProgress.trackInsets = UIEdgeInsetsMake(2.0f, 2.0f, 2.0f, 2.0f);                 // 背景边距
    _bkgProgress.contentInsets = UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f);               // view跟track的边距
    
    [self.contentView addSubview:_bkgProgress];
    [_bkgProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(5.0f);
        make.trailing.equalTo(self.contentView).offset(-5.0f);
        make.top.equalTo(self.normalProgress ? self.normalProgress.mas_bottom : self.contentView).offset(5.0f);
        make.height.mas_equalTo(30);
    }];
    return bkgProgress;
}

#pragma mark - TableViewModelCell

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoProgressViewTableCellViewModel *)viewModel {
    return 100.0f;
}

#pragma mark - VMKProgressViewSource

- (CALayer *)trackLayerOfProgressView:(VMKProgressView *)progressView {
    CALayer *layer = CALayer.layer;
    layer.backgroundColor = UIColor.blueColor.CGColor;
    return layer;
}
//
//- (UIView *)trackViewOfProgressView:(VMKProgressView *)progressView {
//    UIView *view = UIView.new;
//    view.backgroundColor = UIColor.blueColor;
//    return view;
//}

- (CALayer *)progressLayerOfProgressView:(VMKProgressView *)progressView {
    CALayer *layer = CALayer.layer;
    layer.frame = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    layer.backgroundColor = UIColor.yellowColor.CGColor;
    return layer;
}

//- (UIView *)progressViewOfProgressView:(VMKProgressView *)progressView {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
//    view.backgroundColor = UIColor.yellowColor;
//    return view;
//}

- (CALayer *)thumbLayerOfProgressView:(VMKProgressView *)progressView {
    CALayer *layer = CALayer.layer;
    layer.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
    layer.backgroundColor = UIColor.redColor.CGColor;
    return layer;
}
//
//- (UIView *)thumbViewOfProgressView:(VMKProgressView *)progressView {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
//    view.backgroundColor = UIColor.redColor;
//    return view;
//}

@end
