//
//  VMKDemoLabelTableViewModelCell.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/19.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoLabelTableViewModelCell.h"
#import "VMKDemoLabelTableCellViewModel.h"

#import <VMKit/VMKLabel.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface VMKDemoLabelTableViewModelCell ()
@property (weak, nonatomic) VMKLabel *singleLineLabel;
@property (weak, nonatomic) VMKLabel *linkLabel;
@end

@implementation VMKDemoLabelTableViewModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

- (void)setViewModel:(VMKDemoLabelTableCellViewModel *)viewModel {
    BOOL same = self.viewModel == viewModel;
    [super setViewModel:viewModel];
    if (same) {
        // 防止这里不必要的UI刷新。
        return;
    }
    @weakify(self);
    self.singleLineLabel.text = @"single硒鼓相映成趣；是枯井ksdjf枯井ksdjfsdjfdsfdsl；fjsdfj顺；架国；吴三桂";
    self.linkLabel.text = @"link硒鼓相映成趣；是枯井ksdjf枯井ksdjfsdjfdsfdsl；fjsdfj顺；架国；吴三桂";
    
    [[self.singleLineLabel rac_signalForSelector:@selector(layoutSubviews)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self);
        NSLog(@"");
    }];
    [[self.linkLabel rac_signalForSelector:@selector(layoutSubviews)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self);
        NSLog(@"");
    }];
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - Private

#pragma mark - Getter

- (VMKLabel *)singleLineLabel {
    if (_singleLineLabel) {
        return _singleLineLabel;
    }
    VMKLabel *singleLineLabel = VMKLabel.new;
    _singleLineLabel = singleLineLabel;
    _singleLineLabel.numberOfLines = 1;
    _singleLineLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_singleLineLabel];
    [_singleLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(5.0f);
        make.trailing.equalTo(self).offset(-5.0f);
        make.top.equalTo(self).offset(5.0f);
    }];
    return singleLineLabel;
}

- (VMKLabel *)linkLabel {
    if (_linkLabel) {
        return _linkLabel;
    }
    VMKLabel *linkLabel = VMKLabel.new;
    _linkLabel = linkLabel;
    _linkLabel.numberOfLines = 0;
    _linkLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    CGSize linkLabelSize = [_linkLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.contentView.frame) - 5.0f - 5.0f, 0.0f)];
    [self.contentView addSubview:_linkLabel];
    [_linkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(5.0f);
        make.trailing.equalTo(self).offset(-5.0f);
        make.top.equalTo(self.singleLineLabel.mas_bottom).offset(5.0f);
//        make.height.mas_equalTo(linkLabelSize.height);
        make.bottom.equalTo(self.contentView).offset(-5.0f);
    }];
//    [linkLabel sizeToFit];
    return linkLabel;
}

#pragma mark - TableViewModelCell

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoLabelTableCellViewModel *)viewModel {
    VMKDemoLabelTableViewModelCell *cell = [[VMKDemoLabelTableViewModelCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass(VMKDemoLabelTableViewModelCell.class)];
    [cell setViewModel:viewModel];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    [cell layoutIfNeeded];
    CGFloat singleLabelHeight = [cell.singleLineLabel sizeThatFits:CGSizeMake(width - 5.0f - 5.0f, 0.0f)].height;
    CGFloat linkLabelHeight = [cell.linkLabel sizeThatFits:CGSizeMake(width - 5.0f - 5.0f, 0.0f)].height;
    return 5.0f + singleLabelHeight + 5.0f + linkLabelHeight + 5.0;
}

@end
