//
//  VMKProgressView.h
//  
//
//  Created by ItghostFan on 2025/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VMKProgressViewDelegate;
@protocol VMKProgressViewSource;

@interface VMKProgressView : UIView

@property (weak, nonatomic) id<VMKProgressViewSource> source;
@property (weak, nonatomic) id<VMKProgressViewDelegate> delegate;

@property (assign, nonatomic) UIEdgeInsets contentInsets;               // view跟track的边距
@property (assign, nonatomic) UIEdgeInsets trackInsets;                 // 背景边距

@property (assign, nonatomic) CGFloat progress;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

@protocol VMKProgressViewDelegate <NSObject>
@end

@protocol VMKProgressViewSource <NSObject>
@optional

#pragma mark - Track
- (CALayer *)trackLayerOfProgressView:(VMKProgressView *)progressView;
- (UIView *)trackViewOfProgressView:(VMKProgressView *)progressView;
#pragma mark - Progress
- (CALayer *)progressLayerOfProgressView:(VMKProgressView *)progressView;
- (UIView *)progressViewOfProgressView:(VMKProgressView *)progressView;
#pragma mark - Thumb
- (CALayer *)thumbLayerOfProgressView:(VMKProgressView *)progressView;
- (UIView *)thumbViewOfProgressView:(VMKProgressView *)progressView;

@end

NS_ASSUME_NONNULL_END
