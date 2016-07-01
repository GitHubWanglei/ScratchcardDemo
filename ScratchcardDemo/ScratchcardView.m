//
//  ScratchcardView.m
//  ScratchcardDemo
//
//  Created by wanglei on 16/6/30.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ScratchcardView.h"

@interface ScratchcardView ()
@property (nonatomic, strong) UIView *concealedView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation ScratchcardView

+ (instancetype)viewWithFrame:(CGRect)frame concealedView:(UIView *)concealedView maskView:(UIView *)maskView{
    return [[self alloc] initWithFrame:frame concealedView:concealedView maskView:maskView];
}


- (instancetype)initWithFrame:(CGRect)frame concealedView:(UIView *)concealedView maskView:(UIView *)maskView
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.path = [[UIBezierPath alloc] init];
        self.concealedView = concealedView;
        self.concealedView.frame = self.bounds;
        self.maskView = maskView;
        self.maskView.frame = self.bounds;
        
        [self addSubview:self.maskView];
        [self.layer addSublayer:self.concealedView.layer];
        
        self.maskLayer = [CAShapeLayer layer];
        self.maskLayer.frame = concealedView.bounds;
        self.maskLayer.lineCap = kCALineCapRound;
        self.maskLayer.lineJoin = kCALineJoinRound;
        self.maskLayer.lineWidth = 15.f;
        self.maskLayer.strokeColor = [UIColor blackColor].CGColor;
        self.maskLayer.fillColor = nil;
        self.concealedView.layer.mask = self.maskLayer;
        
    }
    return self;
}

- (void)setScratchWidth:(CGFloat)scratchWidth{
    if (scratchWidth > 0) {
        self.maskLayer.lineWidth = scratchWidth;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.path moveToPoint:[[touches anyObject] locationInView:self]];
    self.maskLayer.path = self.path.CGPath;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    [self.path addLineToPoint:[[touches anyObject] locationInView:self]];
    self.maskLayer.path = self.path.CGPath;
}

@end
