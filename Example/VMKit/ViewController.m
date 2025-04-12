//
//  ViewController.m
//  VMKit
//
//  Created by ItghostFans on 04/12/2025.
//  Copyright (c) 2025 ItghostFans. All rights reserved.
//

#import "ViewController.h"

#import <VMKit/VMKLabel.h>
#import <VMKit/VMKButton.h>
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
    
    VMKButton *hImageTitleButton = [self createButton:@"左图右标题" layout:(VMKButtonLayoutHImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    hImageTitleButton.contentEdgeInsets = UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 5.0f);
    
    VMKButton *hTitleImageButton = [self createButton:@"右图左标题" layout:(VMKButtonLayoutHTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(hImageTitleButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    hTitleImageButton.contentEdgeInsets = UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 5.0f);
    
    VMKButton *vImageTitleButton = [self createButton:@"左图右标题" layout:(VMKButtonLayoutVImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(hTitleImageButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    vImageTitleButton.contentEdgeInsets = UIEdgeInsetsMake(5.0f, 0.0f, 5.0f, 0.0f);
    
    VMKButton *vTitleImageButton = [self createButton:@"右图左标题" layout:(VMKButtonLayoutVTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(vImageTitleButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    vTitleImageButton.contentEdgeInsets = UIEdgeInsetsMake(5.0f, 0.0f, 5.0f, 0.0f);
    [self.view layoutIfNeeded];
}

- (VMKButton *)createButton:(NSString *)title layout:(VMKButtonLayout)layout constraintsBlock:(void(^)(MASConstraintMaker  *make))constraintsBlock {
    VMKButton *button = VMKButton.new;
    button.layer.borderColor = UIColor.redColor.CGColor;
    button.layer.borderWidth = 1.0f;
    button.layer.cornerRadius = 10.0f;
    [button setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setImage:[UIImage systemImageNamed:@"heart.fill"] forState:(UIControlStateNormal)];
    button.vmk_layout = layout;
    button.vmk_itemSpacing = 10.0f;
    [self.view addSubview:button];
    [button mas_makeConstraints:constraintsBlock];
    return button;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
