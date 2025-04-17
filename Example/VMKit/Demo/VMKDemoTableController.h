//
//  VMKDemoTableController.h
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import <ViewModel/TableController.h>

NS_ASSUME_NONNULL_BEGIN

@class VMKDemoTableControllerViewModel;

@interface VMKDemoTableController : TableController

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (strong, nonatomic, nullable) VMKDemoTableControllerViewModel *viewModel;
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
