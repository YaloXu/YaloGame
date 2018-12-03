//
//  YGMessageCollectionViewCell.m
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMessageCollectionViewCell.h"
#import "YGMessageTableViewCell.h"
#import "YGMessageDefaultView.h"
#import "YGUtils.h"

@interface YGMessageCollectionViewCell() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) YGMessageDefaultView *defaultView;

@end

@implementation YGMessageCollectionViewCell

- (YGMessageDefaultView *)defaultView {
    if (!_defaultView) {
        _defaultView = [[NSBundle mainBundle] loadNibNamed:@"YGMessageDefaultView" owner:nil options:nil].firstObject;
    }
    return _defaultView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"YGMessageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"messageCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YGMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.section];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BLOCK(self.didSelected,self.dataSource[indexPath.section]);
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (!YGUtils.validArray(_dataSource)) {
        self.tableView.hidden = YES;
        if (self.defaultView.superview) {
            self.defaultView.hidden = NO;
        } else{
            [self addSubview:self.defaultView];
            [self.defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        }
    } else {
        self.defaultView.hidden = YES;
        self.tableView.hidden = NO;
        [self.tableView reloadData];
    }
}

@end
