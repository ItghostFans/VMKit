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

@interface VMKDemoProgressViewTableViewModelCell ()
@property (weak, nonatomic) VMKProgressView *normalProgress;
@property (weak, nonatomic) VMKProgressView *bkgProgress;
@end

@implementation VMKDemoProgressViewTableViewModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.normalProgress.progress = 0.3f;
        self.bkgProgress.progress = 0.0f;
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
    if (_normalProgress) {
        return _normalProgress;
    }
    VMKProgressView *normalProgress = [[VMKProgressView alloc] initWithStyle:(VMKProgressViewStyleNone)];
    _normalProgress = normalProgress;
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
    VMKProgressView *bkgProgress = [[VMKProgressView alloc] initWithStyle:(VMKProgressViewStyleNone)];
    _bkgProgress = bkgProgress;
    
    _bkgProgress.trackBorderWidth = 0.5f;                 // 背景边宽
    _bkgProgress.trackBorderColor = UIColor.redColor;     // 背景边框颜色
    _bkgProgress.trackCornerRadius = CGSizeMake(10.0f, 20.0f);                 // 背景圆角
    _bkgProgress.progressCornerRadius = CGSizeMake(7.0f, 7.0f);              // 进度条圆角
    _bkgProgress.corner = UIRectCornerTopRight | UIRectCornerBottomRight;                      // 圆角
    _bkgProgress.progressBorderWidth = 1.0f;              // 进度条边宽
    _bkgProgress.progressBorderColor = UIColor.brownColor;   // 进度条边框颜色
    _bkgProgress.trackShadowColor = UIColor.blackColor;      // 背景阴影
    _bkgProgress.trackShadowOffset = CGSizeMake(0, 1.0);                 // 背景阴影
    _bkgProgress.trackShadowOpacity = 0.8f;               // 背景阴影
    _bkgProgress.trackInsets = UIEdgeInsetsMake(2.0f, 2.0f, 2.0f, 2.0f);                 // 背景边距
    _bkgProgress.zeroProgressWidth = 14.0f;                // 进度为0.0时的进度条宽度
    _bkgProgress.contentInsets = UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f);               // view跟track的边距
    
    [self.contentView addSubview:_bkgProgress];
    [_bkgProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(5.0f);
        make.trailing.equalTo(self.contentView).offset(-5.0f);
        make.top.equalTo(self.normalProgress.mas_bottom).offset(5.0f);
        make.height.mas_equalTo(30);
    }];
    return bkgProgress;
}

#pragma mark - TableViewModelCell

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoProgressViewTableCellViewModel *)viewModel {
    return 100.0f;
}

@end
