//
//  VMKDemoButtonTableViewModelCell.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoButtonTableViewModelCell.h"
#import "VMKDemoButtonTableCellViewModel.h"

#import <Masonry/Masonry.h>

#import <VMKit/VMKButton.h>

@interface VMKDemoButtonTableViewModelCell ()
@property (weak, nonatomic) VMKButton *hImageTitleButton;
@property (weak, nonatomic) VMKButton *hTitleImageButton;
@property (weak, nonatomic) VMKButton *vImageTitleButton;
@property (weak, nonatomic) VMKButton *vTitleImageButton;
@end

@implementation VMKDemoButtonTableViewModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self hImageTitleButton];
        [self hTitleImageButton];
        [self vImageTitleButton];
        [self vTitleImageButton];
    }
    return self;
}

- (void)setViewModel:(VMKDemoButtonTableCellViewModel *)viewModel {
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

- (VMKButton *)createButton:(NSString *)title layout:(VMKButtonLayout)layout constraintsBlock:(void(^)(MASConstraintMaker  *make))constraintsBlock {
    VMKButton *button = VMKButton.new;
    button.layer.borderColor = UIColor.redColor.CGColor;
    button.layer.borderWidth = 1.0f;
    button.layer.cornerRadius = 10.0f;
    [button setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setImage:[UIImage systemImageNamed:@"heart.fill"] forState:(UIControlStateNormal)];
    button.layout = layout;
    button.itemSpacing = 10.0f;
    [self.contentView addSubview:button];
    [button mas_makeConstraints:constraintsBlock];
    return button;
}

#pragma mark - Getter

- (VMKButton *)hImageTitleButton {
    if (_hImageTitleButton) {
        return _hImageTitleButton;
    }
    VMKButton *hImageTitleButton = [self createButton:NSLocalizedString(@"前图后标题", nil) layout:(VMKButtonLayoutHImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5.0f);
        make.leading.equalTo(self.contentView).offset(5.0f);
    }];
    _hImageTitleButton = hImageTitleButton;
    return hImageTitleButton;
}

- (VMKButton *)hTitleImageButton {
    if (_hTitleImageButton) {
        return _hTitleImageButton;
    }
    VMKButton *hTitleImageButton = [self createButton:NSLocalizedString(@"后图前标题", nil) layout:(VMKButtonLayoutHTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hImageTitleButton.mas_bottom).offset(5.0f);
        make.leading.equalTo(self.contentView).offset(5.0f);
    }];
    _hTitleImageButton = hTitleImageButton;
    return hTitleImageButton;
}

- (VMKButton *)vImageTitleButton {
    if (_vImageTitleButton) {
        return _vImageTitleButton;
    }
    VMKButton *vImageTitleButton = [self createButton:NSLocalizedString(@"上图下标题", nil) layout:(VMKButtonLayoutVImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5.0f);
        make.leading.equalTo(self.hImageTitleButton.mas_trailing).offset(5.0f);
    }];
    _vImageTitleButton = vImageTitleButton;
    return vImageTitleButton;
}

- (VMKButton *)vTitleImageButton {
    if (_vTitleImageButton) {
        return _vTitleImageButton;
    }
    VMKButton *vTitleImageButton = [self createButton:NSLocalizedString(@"下图上标题", nil) layout:(VMKButtonLayoutVTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vImageTitleButton.mas_bottom).offset(5.0f);
        make.leading.equalTo(self.hImageTitleButton.mas_trailing).offset(5.0f);
        make.bottom.equalTo(self.contentView).offset(-5.0f);
    }];
    _vTitleImageButton = vTitleImageButton;
    return vTitleImageButton;
}

#pragma mark - TableViewModelCell

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoButtonTableCellViewModel *)viewModel {
    VMKDemoButtonTableViewModelCell *cell = [[VMKDemoButtonTableViewModelCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass(self)];
    cell.viewModel = viewModel;
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    CGSize cellSize = [cell.contentView sizeThatFits:CGSizeMake(width, 0.0f)];
    return 5.0f + [cell.vImageTitleButton intrinsicContentSize].height + 5.0f + [cell.vTitleImageButton intrinsicContentSize].height + 5.0;
}

@end
