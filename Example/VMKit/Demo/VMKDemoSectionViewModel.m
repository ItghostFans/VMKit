//
//  VMKDemoSectionViewModel.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoSectionViewModel.h"

#import <ViewModel/TableViewModel.h>
#import <ViewModel/SectionViewModel+TableView.h>
#import <ViewModel/SectionViewModel+CollectionView.h>

#if __has_include("VMKDemoTableHeaderView.h")
#import "VMKDemoTableHeaderView.h"
#endif // #if __has_include("VMKDemoTableHeaderView.h")

#if __has_include("VMKDemoTableFooterView.h")
#import "VMKDemoTableFooterView.h"
#endif // #if __has_include("VMKDemoTableFooterView.h")

#if __has_include("VMKDemoCollectionHeaderView.h")
#import "VMKDemoCollectionHeaderView.h"
#endif // #if __has_include("VMKDemoCollectionHeaderView.h")

#if __has_include("VMKDemoCollectionFooterView.h")
#import "VMKDemoCollectionFooterView.h"
#endif // #if __has_include("VMKDemoCollectionFooterView.h")

@interface VMKDemoSectionViewModel ()
@property (assign, nonatomic) BOOL fold;
@end

@implementation VMKDemoSectionViewModel

- (instancetype)initWithViewModels:(NSArray *)viewModels title:(NSString *)title {
    if (self = [super initWithViewModels:viewModels]) {
        _title = title;
    }
    return self;
}

- (void)setFold:(BOOL)fold {
    _fold = fold;
    NSUInteger index = self.tableViewModel.sectionViewModels ? [self.tableViewModel.sectionViewModels indexOfViewModel:self] : NSNotFound;
    if (index != NSNotFound) {
        [self.tableViewModel.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:(UITableViewRowAnimationNone)];
    }
}

#pragma mark - TableView

#if __has_include("VMKDemoTableHeaderView.h")
- (Class)tableHeaderClass {
    return VMKDemoTableHeaderView.class;
}
#endif // #if __has_include("VMKDemoTableHeaderView.h")

#if __has_include("VMKDemoTableFooterView.h")
- (Class)tableFooterClass {
    return VMKDemoTableFooterView.class;
}
#endif // #if __has_include("VMKDemoTableFooterView.h")

#pragma mark - CollectionView

#if __has_include("VMKDemoCollectionHeaderView.h")
- (Class)collectionHeaderClass {
    return VMKDemoCollectionHeaderView.class;
}
#endif // #if __has_include("VMKDemoCollectionHeaderView.h")

#if __has_include("VMKDemoCollectionFooterView.h")
- (Class)collectionFooterClass {
    return VMKDemoCollectionFooterView.class;
}
#endif // #if __has_include("VMKDemoCollectionFooterView.h")

@end
