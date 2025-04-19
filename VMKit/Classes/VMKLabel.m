//
//  VMKLabel.m
//  VMKit
//
//  Created by ItghostFan on 2025/4/12.
//

#import "VMKLabel.h"

@interface VMKLabel ()

@property (strong, nonatomic) NSTextContainer *textContainer;
@property (strong, nonatomic) NSLayoutManager *layoutManager;
@property (strong, nonatomic) NSTextStorage *textStorage;
@property (strong, nonatomic) NSMutableParagraphStyle *paragraphStyle;

@end

@implementation VMKLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _layoutManager = NSLayoutManager.new;
        _textContainer = [[NSTextContainer alloc] initWithSize:frame.size];
        _textContainer.lineFragmentPadding = 0.0f;
        _paragraphStyle = NSMutableParagraphStyle.new;
        [_layoutManager addTextContainer:_textContainer];
        self.font = UILabel.appearance.font;
        self.textColor = UILabel.appearance.textColor;
        self.numberOfLines = UILabel.appearance.numberOfLines;
        self.lineBreakMode  = UILabel.appearance.lineBreakMode;
        
        switch ([UIView userInterfaceLayoutDirectionForSemanticContentAttribute:UIView.appearance.semanticContentAttribute]) {
            case UIUserInterfaceLayoutDirectionLeftToRight: {
                self.textAlignment = NSTextAlignmentNatural;
                _paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
                break;
            }
            case UIUserInterfaceLayoutDirectionRightToLeft: {
                self.textAlignment = NSTextAlignmentNatural;
                _paragraphStyle.baseWritingDirection = NSWritingDirectionRightToLeft;
                break;
            }
            default: {
                break;
            }
        }
        self.backgroundColor = UIColor.clearColor;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    self.textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedText];
    [self.textStorage addLayoutManager:_layoutManager];
    self.textAlignment = _paragraphStyle.alignment;
    [self setNeedsDisplay];
}

- (NSAttributedString *)attributedText {
    return self.textStorage.copy;
}

- (void)setText:(NSString *)text {
    NSMutableDictionary *attributes = NSMutableDictionary.new;
    attributes[NSFontAttributeName] = self.font;
    self.textStorage = [[NSTextStorage alloc] initWithString:text attributes:attributes];
    [self.textStorage addLayoutManager:_layoutManager];
    self.textAlignment = _paragraphStyle.alignment;
    [self setNeedsDisplay];
}

- (NSString *)text {
    return self.textStorage.string;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    if (self.textStorage.length) {
        [self.textStorage enumerateAttributesInRange:NSMakeRange(0, self.textStorage.length)
                                             options:(NSAttributedStringEnumerationOptions)0
                                          usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            if (!attrs[NSForegroundColorAttributeName]) {
                NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:attrs];
                attributes[NSForegroundColorAttributeName] = textColor;
                [self.textStorage setAttributes:attributes range:range];
            }
        }];
    }
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    if (self.textStorage.length) {
        [self.textStorage enumerateAttributesInRange:NSMakeRange(0, self.textStorage.length)
                                             options:(NSAttributedStringEnumerationOptions)0
                                          usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            if (!attrs[NSFontAttributeName]) {
                NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:attrs];
                attributes[NSFontAttributeName] = font;
                [self.textStorage setAttributes:attributes range:range];
            }
        }];
    }
    [self setNeedsDisplay];
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    _textContainer.maximumNumberOfLines = numberOfLines;
    if (numberOfLines == 1) {
        [self setContentHuggingPriority:(UILayoutPriorityDefaultHigh) forAxis:(UILayoutConstraintAxisVertical)];
        [self setContentCompressionResistancePriority:(UILayoutPriorityDefaultLow) forAxis:(UILayoutConstraintAxisVertical)];
    } else {
        [self setContentHuggingPriority:(UILayoutPriorityDefaultLow) forAxis:(UILayoutConstraintAxisVertical)];
        [self setContentCompressionResistancePriority:(UILayoutPriorityDefaultHigh) forAxis:(UILayoutConstraintAxisVertical)];
    }
    [self setNeedsLayout];
}

- (NSInteger)numberOfLines {
    return _textContainer.maximumNumberOfLines;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    _textContainer.lineBreakMode = lineBreakMode;
    [self setNeedsLayout];
}

- (NSLineBreakMode)lineBreakMode {
    return _textContainer.lineBreakMode;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _paragraphStyle.alignment = textAlignment;
    if (self.textStorage.length) {
        [self.textStorage enumerateAttributesInRange:NSMakeRange(0, self.textStorage.length)
                                             options:(NSAttributedStringEnumerationOptions)0
                                          usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            if (!attrs[NSParagraphStyleAttributeName]) {
                NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:attrs];
                attributes[NSParagraphStyleAttributeName] = self.paragraphStyle;
                [self.textStorage setAttributes:attributes range:range];
            }
        }];
    }
    [self setNeedsLayout];
}

- (NSTextAlignment)textAlignment {
    return _paragraphStyle.alignment;
}

#pragma mark - Super

- (CGSize)intrinsicContentSize {
    CGRect textRect = [_layoutManager boundingRectForGlyphRange:NSMakeRange(0, _layoutManager.numberOfGlyphs) inTextContainer:_textContainer];
    return CGSizeMake(ceil(textRect.size.width), ceil(textRect.size.height));
}

- (CGSize)sizeThatFits:(CGSize)size {
    _textContainer.size = size;
    CGRect textRect = [_layoutManager boundingRectForGlyphRange:NSMakeRange(0, _layoutManager.numberOfGlyphs) inTextContainer:_textContainer];
    _textContainer.size = self.bounds.size;
    return CGSizeMake(ceil(textRect.size.width), ceil(textRect.size.height));
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!CGSizeEqualToSize(_textContainer.size, self.bounds.size)) {
        _textContainer.size = self.bounds.size;
        [self invalidateIntrinsicContentSize];
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_layoutManager.numberOfGlyphs) {
        CGRect textRect = [_layoutManager boundingRectForGlyphRange:NSMakeRange(0, _layoutManager.numberOfGlyphs) inTextContainer:_textContainer];
        CGPoint drawPoint = CGPointMake(0.0f, CGRectGetMidY(rect) - CGRectGetMidY(textRect));
        [_layoutManager drawGlyphsForGlyphRange:NSMakeRange(0, _layoutManager.numberOfGlyphs) atPoint:drawPoint];
    }
}

#pragma mark - Actions

- (void)onTap:(UITapGestureRecognizer *)tap {
    CGPoint location = [tap locationInView:self];
    CGRect textRect = [_layoutManager boundingRectForGlyphRange:NSMakeRange(0, _layoutManager.numberOfGlyphs) inTextContainer:_textContainer];
    location.y -= CGRectGetMidY(self.bounds) - CGRectGetMidY(textRect);
    CGFloat distance = 0.0f;
    NSUInteger characterIndex = [_layoutManager characterIndexForPoint:location inTextContainer:_textContainer fractionOfDistanceBetweenInsertionPoints:&distance];
    
//    NSRange range;
//    NSDictionary *attributes = [_textStorage attributesAtIndex:characterIndex effectiveRange:&range];
    if (characterIndex < _textStorage.string.length) {
        NSString *clickedCharacter = [_textStorage.string substringWithRange:NSMakeRange(characterIndex, 1)];
        NSLog(@"Click %@", clickedCharacter);
    }
}

@end
