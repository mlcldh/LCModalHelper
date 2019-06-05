//
//  ViewController.m
//  LCModalHelperDemo
//
//  Created by menglingchao on 2018/1/13.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+LCModalHelper.h"
#import "LCWebViewController.h"
#import "Header.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *titles;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (NSMutableArray *)titles {
    if (! _titles) {
        _titles = [NSMutableArray array];
        for (NSInteger i = 0; i < 25; i ++) {
            NSString *title = @"";
            switch (i) {
                case 0:
                    title = LCDemo_FromBottomToCenter;
                    break;
                case 1:
                    title = LCDemo_FromBottomToBottom;
                    break;
                case 2:
                    title = LCDemo_FromBottomToTop;
                    break;
                case 3:
                    title = LCDemo_FromRightToCenter;
                    break;
                case 4:
                    title = LCDemo_FromRightToRight;
                    break;
                case 5:
                    title = @"";
                    break;
                default:
                    break;
            }
            [_titles addObject:title];
        }
    }
    return _titles;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = self.titles[indexPath.row];
    LCWebViewController *webVC = [[LCWebViewController alloc]init];
    [webVC el_createPresentationDelegateIfNeeded];
    webVC.el_presentationDelegate.maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    if ([title isEqualToString:LCDemo_FromBottomToCenter]) {
        webVC.el_presentationDelegate.presentStartStyle = LCPresentStartStyleFromBottom;
        webVC.el_presentationDelegate.presentShownStyle = LCPresentShownStyleAtCenter;
        webVC.el_presentationDelegate.widthStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.width = 300;
        webVC.el_presentationDelegate.heightStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.height = 300;
    }
    else if([title isEqualToString:LCDemo_FromBottomToBottom]) {
        webVC.el_presentationDelegate.presentStartStyle = LCPresentStartStyleFromBottom;
        webVC.el_presentationDelegate.presentShownStyle = LCPresentShownStyleAtBottom;
        webVC.el_presentationDelegate.widthStyle = LCModalLengthStyleEqualToSuperViewInProportion;
        webVC.el_presentationDelegate.heightStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.height = 300;
    }
    else if([title isEqualToString:LCDemo_FromBottomToTop]) {
        webVC.el_presentationDelegate.presentStartStyle = LCPresentStartStyleFromBottom;
        webVC.el_presentationDelegate.presentShownStyle = LCPresentShownStyleAtTop;
        webVC.el_presentationDelegate.widthStyle = LCModalLengthStyleEqualToSuperViewInProportion;
        webVC.el_presentationDelegate.heightStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.height = 300;
    }
    else if([title isEqualToString:LCDemo_FromRightToCenter]) {
        webVC.el_presentationDelegate.presentStartStyle = LCPresentStartStyleFromRight;
        webVC.el_presentationDelegate.presentShownStyle = LCPresentShownStyleAtCenter;
        webVC.el_presentationDelegate.widthStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.width = 300;
        webVC.el_presentationDelegate.heightStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.height = 300;
    }
    else if([title isEqualToString:LCDemo_FromRightToRight]) {
        webVC.el_presentationDelegate.presentStartStyle = LCPresentStartStyleFromRight;
        webVC.el_presentationDelegate.presentShownStyle = LCPresentShownStyleAtRight;
        webVC.el_presentationDelegate.widthStyle = LCModalLengthStyleFixedValue;
        webVC.el_presentationDelegate.width = 100;
        webVC.el_presentationDelegate.heightStyle = LCModalLengthStyleEqualToSuperViewInProportion;
    }
    else if([title isEqualToString:@""]) {
        
    }
    [self presentViewController:webVC animated:YES completion:^{
    }];
//    [self presentViewController:webVC animated:NO completion:^{//调试使用
//    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titles[indexPath.row];//self.titles[indexPath.row];
    
    return cell;
}

@end
