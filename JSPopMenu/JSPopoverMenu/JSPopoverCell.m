//
//  JSPopoverCell.m
//  JSPopMenu
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "JSPopoverCell.h"
#import <masonry.h>

@interface JSPopoverCell ()
//图标
@property (nonatomic, strong)UIImageView *iconImageView;
//文字
@property (nonatomic, strong)UILabel *textLB;

@end

@implementation JSPopoverCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconImageView];
        
        _textLB = [[UILabel alloc]init];
        _textLB.textColor = [UIColor blackColor];
        _textLB.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_textLB];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16.5);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [_textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(12.1);
        make.height.mas_equalTo(22);
    }];
}

- (void)setModel:(JSPopoverModel *)model{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:model.imageName];
    _textLB.text = model.title;
}

@end
