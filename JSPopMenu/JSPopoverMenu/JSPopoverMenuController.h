//
//  JSPopoverMenuController.h
//  JSPopMenu
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSPopoverMenuControllerDelegate <NSObject>

- (void)js_popoverMenuSelectedIndex:(NSInteger)index;

@end

@interface JSPopoverMenuController : UIViewController

@property (nonatomic, weak) id<JSPopoverMenuControllerDelegate>delegate;

@end
