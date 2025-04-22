//
//  VMKDemoProgressViewTableViewModelCell.h
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/21.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import <ViewModel/TableViewModelCell.h>

NS_ASSUME_NONNULL_BEGIN

@class VMKDemoProgressViewTableCellViewModel;

@interface VMKDemoProgressViewTableViewModelCell : TableViewModelCell

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (weak, nonatomic, nullable) VMKDemoProgressViewTableCellViewModel *viewModel;
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
