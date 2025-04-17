//
//  VMKDemoSectionViewModel.h
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import <ViewModel/SectionViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@class VMKDemoSectionViewModel;

@protocol IVMKDemoSectionViewModelDelegate <IBaseViewModelDelegate>
@end

@interface VMKDemoSectionViewModel : SectionViewModel

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (weak, nonatomic, nullable) id<IVMKDemoSectionViewModelDelegate> delegate;
#pragma clang diagnostic pop

@property (strong, nonatomic, nonnull, readonly) NSString *title;

- (instancetype)initWithViewModels:(NSArray * _Nullable)viewModels title:(NSString * _Nonnull)title;

@end

NS_ASSUME_NONNULL_END
