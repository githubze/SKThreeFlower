//
//  SKThreeFlowerCell.m
//  PPKProject
//
//  Created by 阿汤哥 on 2019/10/22.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import "SKThreeFlowerCell.h"

@implementation SKThreeFlowerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(18);
        make.top.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-5);
    }];
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero text:@"标题" textColor:UIColorFromRGB(0x6E6E6E) font:kFontFix(14)];
    }
    return _nameLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
