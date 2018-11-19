//
//  YGBaseViewController.h
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGBaseViewController : UIViewController
@property (nonatomic , strong) NSString * headTitle;
-(void)setRightBarItemWithImage:(NSString*)imageName;
-(void)rightBarItemEvent;
@end

NS_ASSUME_NONNULL_END
