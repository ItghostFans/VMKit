//
//  ViewController.m
//  VMKit
//
//  Created by ItghostFans on 04/12/2025.
//  Copyright (c) 2025 ItghostFans. All rights reserved.
//

#import "ViewController.h"

#import <VMKit/VMKLabel.h>
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    VMKLabel *label = VMKLabel.new;
    label.text = @"硒鼓相映成趣；是枯井ksdjf枯井ksdjfsdjfdsfdsl；fjsdfj顺；架国；吴三桂";
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).multipliedBy(0.5f);
        make.center.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
