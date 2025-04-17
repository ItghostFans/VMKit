//
//  VMKDemoTableHeaderView.h
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import <ViewModel/TableHeaderView.h>

NS_ASSUME_NONNULL_BEGIN

@class VMKDemoSectionViewModel;

@interface VMKDemoTableHeaderView : TableHeaderView

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (weak, nonatomic, nullable) VMKDemoSectionViewModel *viewModel;
#pragma clang diagnostic pop

+ (CGFloat)heightForWidth:(CGFloat)width viewModel:(VMKDemoSectionViewModel * _Nonnull)viewModel;

@end

NS_ASSUME_NONNULL_END
