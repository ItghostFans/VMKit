//
//  VMKDemoTableControllerViewModel.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoTableControllerViewModel.h"
#import <ViewModel/TableViewModel.h>

#import "VMKDemoSectionViewModel.h"
#import "VMKDemoButtonTableCellViewModel.h"

@implementation VMKDemoTableControllerViewModel

- (instancetype)initWithTableViewModel:(TableViewModel *)tableViewModel {
    if (self = [super initWithTableViewModel:tableViewModel]) {
        VMKDemoSectionViewModel *sectionViewModel = [[VMKDemoSectionViewModel alloc] initWithViewModels:nil title:NSLocalizedString(@"按钮", nil)];
        VMKDemoButtonTableCellViewModel *cellViewModel = VMKDemoButtonTableCellViewModel.new;
        [sectionViewModel addViewModel:cellViewModel];
        [self.tableViewModel.sectionViewModels addViewModel:sectionViewModel];
    }
    return self;
}

@end
