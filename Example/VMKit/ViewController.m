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
    
    VMKButton *hImageTitleButton = [self createButton:NSLocalizedString(@"前图后标题", nil) layout:(VMKButtonLayoutHImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    hImageTitleButton.contentEdgeInsets = UIEdgeInsetsMake(10.0f, 15.0f, 10.0f, 15.0f);
    
    VMKButton *hTitleImageButton = [self createButton:NSLocalizedString(@"后图前标题", nil) layout:(VMKButtonLayoutHTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(hImageTitleButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    hTitleImageButton.contentEdgeInsets = UIEdgeInsetsMake(10.0f, 15.0f, 10.0f, 15.0f);
    
    VMKButton *vImageTitleButton = [self createButton:NSLocalizedString(@"上图下标题", nil) layout:(VMKButtonLayoutVImageTitle) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(hTitleImageButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    vImageTitleButton.contentEdgeInsets = UIEdgeInsetsMake(15.0f, 10.0f, 15.0f, 10.0f);
    
    VMKButton *vTitleImageButton = [self createButton:NSLocalizedString(@"下图上标题", nil) layout:(VMKButtonLayoutVTitleImage) constraintsBlock:^(MASConstraintMaker *make) {
        make.top.equalTo(vImageTitleButton.mas_bottom);
        make.centerX.equalTo(self.view);
    }];
    vTitleImageButton.contentEdgeInsets = UIEdgeInsetsMake(15.0f, 10.0f, 15.0f, 10.0f);
    
//    UITextView *textView = UITextView.new;
//    textView.font = [UIFont systemFontOfSize:12.0f];
//    textView.layer.borderColor = UIColor.redColor.CGColor;
//    textView.layer.borderWidth = 1.0f;
//    
//    textView.textContainer.lineFragmentPadding = 0.0f;
//    textView.textContainerInset = UIEdgeInsetsZero;
//    
//    [self.view addSubview:textView];
//    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(label.mas_top);
//        make.centerX.equalTo(self.view);
//        make.width.equalTo(self.view).multipliedBy(0.8f);
//        make.height.mas_equalTo(100.0f);
//    }];
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
