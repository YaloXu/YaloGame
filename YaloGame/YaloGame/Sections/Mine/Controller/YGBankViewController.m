//
//  YGBankViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankViewController.h"
#import "YGBankTableViewCell.h"
#import "YGBindCardViewController.h"

@interface YGBankAddCardView : UIView {
    
    UIButton *_addButton;
    
    UIView *_borderView;
    
}

@end

@implementation YGBankAddCardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    _borderView = [UIView new];
    _borderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_borderView];
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"bankCard_add"] forState:UIControlStateNormal];
    [self addSubview:_addButton];
    _borderView.layer.masksToBounds = YES;
    _borderView.layer.borderWidth = .5;
    _borderView.layer.cornerRadius = 5;
    [_borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(16);
        make.bottom.equalTo(self.mas_bottom).with.offset(-8);
        make.right.equalTo(@(-16));
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(90, 20));
    }];
    [_addButton setTitle:@"添加银行卡" forState:UIControlStateNormal];
    _addButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _addButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    [_addButton setTitleColor:UIColorFromRGBValue(0x979AA1) forState:UIControlStateNormal];
   
}

- (void)layoutSubviews {
    [super layoutSubviews];
   _borderView.layer.borderColor = UIColorFromRGBValue(0x979AA1).CGColor;
}

- (void)updateView:(BOOL)update {
    _addButton.titleLabel.font = [UIFont systemFontOfSize:update ? 11 : 12];
}

@end

@interface YGBankViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) YGBankAddCardView *cardView;

@end

@implementation YGBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"银行卡";
    [self loadData];
    self.tableView.backgroundColor = DefaultBackGroundColor;
    YGBankAddCardView *addView = [[YGBankAddCardView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:addView];
    _cardView = addView;
    addView.userInteractionEnabled = YES;
    [addView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBankCard)]];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YGBankTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(addView.mas_bottom);
    }];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.managerType == YGBankManagerType_Add ? @"管理" : @"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    [self adjustFont];
}

- (void)loadData {
    [YGLoadingTools beginLoading];
    [YGNetworkCommon getBankCardsWithPage:0 total:10 success:^(id  _Nonnull responseObject) {
        [YGLoadingTools endLoading];
    } failed:^(NSDictionary * _Nonnull errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YGBankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 82;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 16;
}

- (void)addBankCard {
    [self.navigationController pushViewController:[YGBindCardViewController new] animated:YES];
}

- (void)setManagerType:(YGBankManagerType)managerType {
    _managerType = managerType;
    if (_managerType == YGBankManagerType_Add) {
        self.navigationItem.rightBarButtonItem.title = @"管理";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"取消";
    }
    [self adjustFont];
}

- (void)adjustFont {
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
}

- (void)cancelAction {
    if (self.managerType == YGBankManagerType_Add) {
        self.managerType = YGBankManagerType_Cancel;
        [self.cardView updateView:YES];
    } else {
        self.managerType = YGBankManagerType_Add;
        [self.cardView updateView:NO];
    }
}



@end
