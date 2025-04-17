//
//  VMKDemoTableHeaderView.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoTableHeaderView.h"
#import "VMKDemoSectionViewModel.h"

#import <Masonry/Masonry.h>
#import <VMKit/VMKLabel.h>

@interface VMKDemoTableHeaderView ()
@property (weak, nonatomic) VMKLabel *titleLabel;
@end

@implementation VMKDemoTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColor.lightGrayColor;
    }
    return self;
}

- (void)setViewModel:(VMKDemoSectionViewModel *)viewModel {
    BOOL same = self.viewModel == viewModel;
    [super setViewModel:viewModel];
    if (same) {
        // 防止这里不必要的UI刷新。
        return;
    }
    self.titleLabel.text = viewModel.title;
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - Private

#pragma mark - Getter

- (VMKLabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    VMKLabel *titleLabel = VMKLabel.new;
    _titleLabel = titleLabel;
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    _titleLabel.textColor = UIColor.systemBlueColor;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(5.0f);
        make.centerY.equalTo(self.contentView);
        make.trailing.lessThanOrEqualTo(self.contentView).offset(-5.0f);
    }];
    return titleLabel;
}

#pragma mark - TableHeaderView

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoSectionViewModel *)viewModel {
    return 30.0f;
}

@end
