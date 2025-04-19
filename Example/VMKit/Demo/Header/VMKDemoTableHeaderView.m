//
//  VMKDemoTableHeaderView.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoTableHeaderView.h"
#import "VMKDemoSectionViewModel.h"
#import "VMKDemoSectionViewModel+Private.h"

#import <Masonry/Masonry.h>
#import <VMKit/VMKLabel.h>
#import <VMKit/VMKButton.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface VMKDemoTableHeaderView ()
@property (weak, nonatomic) VMKLabel *titleLabel;
@property (weak, nonatomic) VMKButton *stateButton;
@property (weak, nonatomic, nullable) RACCompoundDisposable *disposableBag;
@end

@implementation VMKDemoTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColor.lightGrayColor;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [self.contentView addGestureRecognizer:tap];
        self.disposableBag = RACCompoundDisposable.new;
    }
    return self;
}

- (void)setViewModel:(VMKDemoSectionViewModel *)viewModel {
    BOOL same = self.viewModel == viewModel;
    [super setViewModel:viewModel];
    if (!viewModel) {
        [self.disposableBag dispose];
        self.disposableBag = nil;
    }
    if (same) {
        // 防止这里不必要的UI刷新。
        return;
    }
    @weakify(self);
    self.disposableBag = RACCompoundDisposable.new;
    RACDisposable *foldDisposable = [RACObserve(viewModel, fold) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.stateButton.selected = [x boolValue];
    }];
    RACDisposable *titleDisposable = [RACObserve(viewModel, title) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.titleLabel.text = x;
    }];
    [self.disposableBag addDisposable:foldDisposable];
    [self.disposableBag addDisposable:titleDisposable];
}

#pragma mark - Public

#pragma mark - Actions

- (void)onTap:(UITapGestureRecognizer *)tap {
    self.viewModel.fold = !self.viewModel.fold;
}

#pragma mark - Private

#pragma mark - Getter

- (VMKButton *)stateButton {
    if (_stateButton) {
        return _stateButton;
    }
    VMKButton *stateButton = VMKButton.new;
    _stateButton = stateButton;
    [_stateButton setImage:[UIImage systemImageNamed:@"chevron.up"] forState:(UIControlStateNormal)];
    [_stateButton setImage:[UIImage systemImageNamed:@"chevron.down"] forState:(UIControlStateSelected)];
    [self.contentView addSubview:_stateButton];
    [_stateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).offset(-5.0f);
    }];
    return stateButton;
}

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
