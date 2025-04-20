//
//  VMKLabel.h
//  VMKit
//
//  Created by ItghostFan on 2025/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VMKLabel : UIView

@property (strong, nonatomic) NSAttributedString *attributedText;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) NSInteger numberOfLines;
@property (assign, nonatomic) NSLineBreakMode lineBreakMode;
@property (assign, nonatomic) NSTextAlignment textAlignment;

#pragma mark - VMKLabel

- (NSAttributedString *)attributedTextAtPoint:(CGPoint)point;
- (NSAttributedString *)attributedCharacterAtPoint:(CGPoint)point;


@end

NS_ASSUME_NONNULL_END
