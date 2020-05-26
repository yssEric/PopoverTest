//
//  ViewController.m
//  PopoverTest
//
//  Created by Apple on 2020/5/26.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"
#import "ASPopover.h"

@interface ViewController ()
@property (nonatomic, strong) ASPopover *itemPopover;
@property (nonatomic, strong) ASPopover *btnPopover;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUi];
}

#pragma mark - //creatUi
- (void)creatUi {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"item" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem:)];
    for (int i = 0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 400+i*(30+20), 100, 30);
        btn.backgroundColor = [UIColor redColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(oneTime:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
- (void)oneTime:(UIButton *)btn {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 100)];
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, view.frame.size.width-40, view.frame.size.height)];
      [view addSubview:la];
    la.numberOfLines = 0;
    la.textColor = [UIColor whiteColor];
    la.font = [UIFont systemFontOfSize:10.0];
    la.text = [NSString stringWithFormat:@"第%ld名标题\n2020-04-20\n付款主订单数：2,512笔\n付款主订单数占比：77.12%%",(long)btn.tag];
    [self.btnPopover show:view fromView:btn];  // in delegate window
}

- (void)clickItem:(id)sender {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
  UIView *itemView = [self.navigationItem.rightBarButtonItem valueForKey:@"view"]; // you should use custom view in item;
  if (itemView) {
    [self.itemPopover show:view fromView:itemView];
  }
}

#pragma mark - //lazy
- (ASPopover *)itemPopover {
  if (!_itemPopover) {
    ASPopoverOption *option = [[ASPopoverOption alloc] init];
    option.autoAjustDirection = YES;
    option.arrowSize = CGSizeMake(10, 7);
    option.offset = 3;  // vertical offset from original show point, default is 0.
    option.blackOverlayColor = [UIColor clearColor];
    option.sideEdge = 7;
    option.dismissOnBlackOverlayTap = YES;
    option.popoverColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    option.animationIn = 0.4;
    option.springDamping = 0.5;
    option.initialSpringVelocity = 1;
    option.overlayBlur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //...
    
    _itemPopover = [[ASPopover alloc] initWithOption:option];
  }
  return _itemPopover;
}
- (ASPopover *)btnPopover {
  if (!_btnPopover) {
    ASPopoverOption *option = [[ASPopoverOption alloc] init];
    option.autoAjustDirection = YES;
    option.preferedType = ASPopoverTypeUp;
    option.arrowSize = CGSizeMake(10, 7);
    option.blackOverlayColor = [UIColor clearColor];
      option.popoverColor = [UIColor colorWithDisplayP3Red:67/255.0 green:81/255.0 blue:94/255.0 alpha:1];
    option.dismissOnBlackOverlayTap = YES;
    option.animationIn = 0.5;
      option.cornerRadius = 8.0;
    //...
    
    _btnPopover = [[ASPopover alloc] initWithOption:option];
  }
  return _btnPopover;
}

@end
