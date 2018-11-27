//
//  YGMineFooterView.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMineFooterView.h"
#import "YGCollectionViewCell.h"

@interface YGMineFooterView() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSArray <NSString *> *_dataSource;
    NSArray <NSString *> *_imageNames;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation YGMineFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.headerReferenceSize = CGSizeZero;
    layout.footerReferenceSize = CGSizeMake(kScreenWidth - 32, 20);
    self.collectionView.scrollEnabled = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:@"YGCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    _dataSource = @[@"充值",@"提现",@"交易明细",@"银行卡",@"消息日志",@"优惠活动",@"分享",@"设置"];
    _imageNames = @[@"mine_recharge",@"mine_rollout",@"mine_transaction",@"mine_bankcard",@"mine_message",@"mine_huodong",@"shared_icon",@"mine_setting"];
//    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLabel.text = _dataSource[indexPath.item];
    cell.imageView.image = [UIImage imageNamed:_imageNames[indexPath.item]];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth - 32) / 3, 96);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        footer.backgroundColor = UIColor.whiteColor;
        return footer;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelected:)]) {
        [self.delegate collectionViewDidSelected:indexPath];
    }
}

@end

@interface YGUnLoginView()

@end

@implementation YGUnLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_header_bg"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(226);
    }];
    UIView *view = [UIView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140, 30));
        make.bottom.equalTo(@(-40));
        make.centerX.equalTo(self);
    }];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:loginButton];
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:registerButton];
    loginButton.titleLabel.font = registerButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor clearColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(view);
        make.width.mas_equalTo(70);
    }];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(view);
        make.width.mas_equalTo(70);
    }];
    view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 15;
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [registerButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
}

- (void)login {
    if (self.loginHandler) {
        self.loginHandler();
    }
}

- (void)registerUser{
    if (self.registerHandler) {
        self.registerHandler();
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CALayer *layer = [CALayer layer];
    [self.layer addSublayer:layer];
    layer.backgroundColor = UIColor.whiteColor.CGColor;
    layer.frame = CGRectMake(kScreenWidth / 2 - 1, CGRectGetHeight(self.frame) - 40 - 30, 1, 30);
}

@end
