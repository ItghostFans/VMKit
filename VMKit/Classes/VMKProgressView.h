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
    VMKProgressViewStyleGradientTrack       = 1,
    VMKProgressViewStyleGradientProgress    = 1 << 1,
    VMKProgressViewStyleNormalThumb         = 1 << 2,
};

@interface VMKProgressView : UIView

@property (assign, nonatomic) VMKProgressViewStyle style;
@property (assign, nonatomic) CGFloat progress;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
