//
//  ViewController.m
//  JSPopMenu
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "ViewController.h"
#import "JSPopoverMenuController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate,JSPopoverMenuControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];}

- (IBAction)popAction:(id)sender {
    
    JSPopoverMenuController *menu = [[JSPopoverMenuController alloc]init];
    [menu setDelegate:self];
    //目标视图
    menu.popoverPresentationController.sourceView = self.navigationController.navigationBar;
    //目标尺寸的具体位置
    menu.popoverPresentationController.sourceRect = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 0, 70, 50);
    menu.popoverPresentationController.delegate = self;
    [self presentViewController:menu animated:YES completion:nil];
}

//设置代理为None 否则不生效
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}
#pragma mark - YXWPopoverMenuControllerDelegate

- (void)js_popoverMenuSelectedIndex:(NSInteger)index{//更多选中代理
    
    if (index == 0) {//消息
        
        
    }else if (index == 1){//二维码
        

    }
}


@end
