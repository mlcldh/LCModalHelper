//
//  LCWebViewController.m
//  MengPresent
//
//  Created by menglingchao on 2017/8/24.
//  Copyright © 2017年 menglingchao. All rights reserved.
//

#import "LCWebViewController.h"
//#import "LCModalHelper.h"
#import <WebKit/WebKit.h>
#import "UIViewController+LCModalHelper.h"
#import "Masonry.h"

@interface LCWebViewController ()

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIButton *button;

@end

@implementation LCWebViewController

- (void)dealloc {
    NSLog(@"%@ dealloc",self);
}
- (instancetype)init {
    self = [super init];
    if (self) {
//        [self presentationDelegate];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"hehe";
//    self.view.backgroundColor = [UIColor cyanColor];
    [self webView];
    [self button];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
//- (BOOL)prefersStatusBarHidden {//隐藏状态栏
//    return YES;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];//@"http://blog.csdn.net/mlcldh"
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }
    return _webView;
}
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button.backgroundColor = [UIColor yellowColor];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.view).offset(50);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _button;
}
//- (LCModalHelper *)presentationDelegate {
//    if (!_presentationDelegate) {
//        _presentationDelegate = [[LCModalHelper alloc]init];
//        _presentationDelegate.viewController = self;
//    }
//    return _presentationDelegate;
//}
#pragma mark - Event
- (void)buttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
