//
//  YGBankViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankViewController.h"
#import "YGBankTableViewCell.h"

@interface YGBankAddCardView : UIView {
    
    UIImageView *_addImageView;
    
    UILabel *_addLabel;
    
    UIView *_borderView;
}

@end

@implementation YGBankAddCardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    _borderView = [UIView new];
    [self addSubview:_borderView];
    _addImageView = [UIImageView new];
    _addLabel = [UILabel new];
    [self addSubview:_addImageView];
    [self addSubview:_addLabel];
    [_borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
        make.right.equalTo(@(-15));
    }];
    [_addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerX.equalTo(self.mas_centerX).with.offset(-30);
    }];
    [_addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self); make.left.equalTo(_addImageView.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    _addImageView.backgroundColor = [UIColor redColor];
    _addLabel.text = @"添加银行卡";
    _addLabel.font = [UIFont systemFontOfSize:13];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _borderView.layer.masksToBounds = YES;
    _borderView.layer.borderWidth = .5;
    _borderView.layer.borderColor = UIColor.grayColor.CGColor;
    _borderView.layer.cornerRadius = 5;
}

@end

@interface YGBankViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"银行卡";
    YGBankAddCardView *addView = [[YGBankAddCardView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:addView];
    addView.userInteractionEnabled = YES;
    [addView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBankCard)]];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(65);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YGBankTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(@70);
    }];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.managerType == YGBankManagerType_Add ? @"取消" : @"管理" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YGBankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)addBankCard {
}

- (void)cancelAction {
    if (self.managerType == YGBankManagerType_Add) {
        
    } else {
        
    }
    
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
