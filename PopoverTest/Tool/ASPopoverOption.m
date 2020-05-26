//
//  ASPopoverOption.m
//  PopoverObjC
//
//  Created by Apple on 2020/5/26.
//

#import "ASPopoverOption.h"

@implementation ASPopoverOption

- (instancetype)init {
  if (self = [super init]) {
      [self startInit];
  }
  return self;
}
#pragma mark - //startInit
- (void)startInit {
    _arrowSize = CGSizeMake(10, 7);
    _offset = 0.0;
    _animationIn = 0.6;
    _animationOut = 0.3;
    _cornerRadius = 2.0;
    _sideEdge = 5.0;
    _autoAjustDirection = YES;
    _popoverType = ASPopoverTypeUp;
    _preferedType = ASPopoverTypeUp;
    _blackOverlayColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    _popoverColor = [UIColor lightGrayColor];
    _dismissOnBlackOverlayTap = YES;
    _showBlackOverlay = YES;
    _springDamping = 0.7;
    _initialSpringVelocity = 3.0;
    _highlightFromView = NO;
    _highlightCornerRadius = 0.0;
}

@end
