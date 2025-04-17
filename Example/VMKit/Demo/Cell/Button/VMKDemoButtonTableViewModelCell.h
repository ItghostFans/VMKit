//
//  VMKDemoButtonTableViewModelCell.h
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import <ViewModel/TableViewModelCell.h>

NS_ASSUME_NONNULL_BEGIN

@class VMKDemoButtonTableCellViewModel;

@interface VMKDemoButtonTableViewModelCell : TableViewModelCell

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (weak, nonatomic, nullable) VMKDemoButtonTableCellViewModel *viewModel;
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
