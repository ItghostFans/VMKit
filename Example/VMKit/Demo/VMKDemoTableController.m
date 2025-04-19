//
//  VMKDemoTableController.m
//  VMKit_Example
//
//  Created by ItghostFan on 2025/4/15.
//  Copyright © 2025 ItghostFans. All rights reserved.
//

#import "VMKDemoTableController.h"
#import "VMKDemoTableControllerViewModel.h"
#import "VMKDemoSectionViewModel.h"

#import <ViewModel/TableViewModel.h>
#import <ViewModel/TableViewModel+UITableViewDataSource.h>
#import <Masonry/Masonry.h>

@interface VMKDemoTableController () <UITableViewDataSource>
// TODO: 添加需要的View，建议使用懒加载
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
@implementation VMKDemoTableController
#pragma clang diagnostic pop

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        self.viewModel = VMKDemoTableControllerViewModel.new;
//    }
//    return self;
//}
//
//- (instancetype)init {
//    if (self = [super init]) {
//        self.viewModel = VMKDemoTableControllerViewModel.new;
//    }
//    return self;
//}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.viewModel = [[VMKDemoTableControllerViewModel alloc] initWithTableViewModel:TableViewModel.new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.view layoutIfNeeded];
    self.viewModel.tableViewModel.tableView = self.tableView;
    self.tableView.dataSource = self;
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - Private

#pragma mark - Getter

// TODO: 添加需要的View，建议使用懒加载

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    VMKDemoSectionViewModel *sectionViewModel = self.viewModel.tableViewModel.sectionViewModels[section];
    if (sectionViewModel.fold) {
        return 0;
    }
    return [self.viewModel.tableViewModel tableView:tableView numberOfRowsInSection:section];
}

@end
