//
//  ItemOneViewController.m
//  DMWeexSingle
//
//  Created by leoliu on 2018/11/11.
//  Copyright © 2018 leoliu. All rights reserved.
//

#import "ItemOneViewController.h"
#import <WeexSDK/WXSDKInstance.h>

#define BUNDLE_URL [NSString stringWithFormat:@"file://%@/bundlejs/index.js",[NSBundle mainBundle].bundlePath]

@interface ItemOneViewController ()
{
    WXSDKInstance * _instance;
}
@property (nonatomic, assign) CGFloat weexHeight;
@property (nonatomic, strong) UIView *weexView;

@property (nonatomic, strong) NSURL *url;
@end

@implementation ItemOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        //process failure
        NSLog(@"error:%@",error.localizedDescription);
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
        NSLog(@"renderFinish");
    };
    NSURL *URL = [NSURL URLWithString:BUNDLE_URL];
    NSString *randomURL = [NSString stringWithFormat:@"%@%@random=%d",URL.absoluteString,URL.query?@"&":@"?",arc4random()];
    self.url = URL;
    [_instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
}

- (void)viewDidLayoutSubviews
{
    _weexHeight = self.view.frame.size.height;
    UIEdgeInsets safeArea = UIEdgeInsetsZero;
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        safeArea = self.view.safeAreaInsets;
    } else {
        // Fallback on earlier versions
    }
#endif
    _instance.frame = CGRectMake(safeArea.left, safeArea.top, self.view.frame.size.width-safeArea.left-safeArea.right, _weexHeight-safeArea.bottom);
    
}

- (void)dealloc
{
    [_instance destroyInstance];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
