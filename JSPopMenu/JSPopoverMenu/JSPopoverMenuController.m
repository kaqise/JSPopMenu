//
//  JSPopoverMenuController.m
//  JSPopMenu
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "JSPopoverMenuController.h"
#import "JSPopoverCell.h"


@interface JSPopoverMenuController ()

<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSArray <JSPopoverModel *> *models;

@end

@implementation JSPopoverMenuController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ExaminePopover" ofType:@"plist"];
        NSArray *datas = [[NSArray alloc]initWithContentsOfFile:filePath];
        
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:datas.count];
        for (NSDictionary *dic in datas) {
            JSPopoverModel *model = [JSPopoverModel new];
            [model setValuesForKeysWithDictionary:dic];
            [models addObject:model];
        }
        _models = [models copy];
        
        self.modalPresentationStyle = UIModalPresentationPopover;
        //箭头方向
        self.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
        //内容大小
        self.preferredContentSize = CGSizeMake(99.5, 44 * _models.count);
        self.popoverPresentationController.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[JSPopoverCell class] forCellReuseIdentifier:@"JSPopoverCell"];
    }
    return _tableView;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JSPopoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSPopoverCell" forIndexPath:indexPath];
    cell.model = _models[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self.delegate js_popoverMenuSelectedIndex:indexPath.row];
    }];
}




@end
