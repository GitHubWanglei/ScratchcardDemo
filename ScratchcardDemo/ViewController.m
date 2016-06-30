//
//  ViewController.m
//  ScratchcardDemo
//
//  Created by lihongfeng on 16/6/30.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "ScratchcardView.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *v1 = [[UIView alloc] init];
    v1.backgroundColor = [UIColor grayColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"reward.png"];
    
    ScratchcardView *v = [ScratchcardView viewWithFrame:CGRectMake(30, 100, self.view.bounds.size.width-60, 70)
                                          concealedView:imageView
                                               maskView:v1];
    v.scratchWith = 20;
    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
