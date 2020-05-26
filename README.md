# popoverTest
自定义气泡

示例：

1、初始
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

2、调用
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
