//
//  Theme.h
//  YaloGame
//
//  Created by maomao on 2018/11/15.
//  Copyright © 2018年 C. All rights reserved.
// app 颜色 字体

#ifndef Theme_h
#define Theme_h
#pragma mark -  * * * * * * * * * * * * * * 主题 * * * * * * * * * * * * * *
/**
 *  无色
 */
#define kClearColor [UIColor clearColor]
/**
 *  默认页面背景色
 */
#define DefaultBackGroundColor UIColorFromRGBValue(0Xf2f2f2)
/**
 *  默认白色
 */
#define WhiteColor UIColorFromRGBValue(0Xffffff)
/**
 *  导航背景颜色
 */
#define NavgationBgColor UIColorFromRGBValue(0X2e3039)

/**
 *  导航标题颜色
 */
#define NavgationTitleColor UIColorFromRGBValue(0Xffffff)
/**
 *  TabBar 标题颜色(有误)
 */
#define TabBarTitleColor UIColorFromRGBValue(0Xe3c793)

/**
 *  分割线灰色等...
 */
#define kBackDefaultGrayColor UIColorFromRGBValue(0Xdbdfe8)
/**
 *  主要字体颜色
 */
#define kMainFontColor UIColorFromRGBValue(0X333333)
/**
 *  次要字体颜色
 */
#define kSecondaryFontColor UIColorFromRGBValue(0X999999)
/**
 *  辅助字体颜色
 */
#define kAuxiliaryFontColor UIColorFromRGBValue(0Xcccccc)
/**
 *  默认字体颜色(非点击状态)
 */
#define kNormalFontColor UIColorFromRGBValue(0X999999)


#pragma mark -  * * * * * * * * * * * * * * 主要间距 * * * * * * * * * * * * * *
/**
 *  导航标题 大标题
 */
#define TitleFontSize [UIFont systemFontOfSize:18]
/**
 *  正文，小按钮，tabbar文字，我的界面文字
 */
#define ContentFontSize [UIFont systemFontOfSize:12]
/**
 *  大按钮
 */
#define ButtonFontSize [UIFont systemFontOfSize:15]

#pragma mark -  * * * * * * * * * * * * * * set Button * * * * * * * * * * * * * *

/**
 * 左右间距
 */
#define kSpace 16
#pragma mark -  * * * * * * * * * * * * * * set Button * * * * * * * * * * * * * *
/**
 *  按钮的背景默认颜色
 */
#define kButtonBackColorForNormal UIColorFromRGBValue(0Xe3c793)
/**
 *  按钮的背景点击颜色
 */
#define kButtonBackColorForSelect UIColorFromRGBValue(0X000000)
/**
 *  按钮的背景不可点击颜色
 */
#define kButtonBackColorForDisabled UIColorFromRGBValue(0X7fcaf9)


/**
 *  R,G,B ／ A
 */
#define kRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define kRGB_alpha(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
/**
 *  十六进制颜色
 */
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif /* Theme_h */
