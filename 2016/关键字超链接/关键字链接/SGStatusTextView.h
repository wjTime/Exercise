//
//  SGStatusTextView.h
//  关键字链接
//
//  Created by wenjie on 16/8/11.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGStatusTextView : UIView
@property (nonatomic, weak) UITextView *tv;
@property (nonatomic, copy) NSAttributedString *attributedText;
@property (nonatomic, strong) NSArray *specialSegments;

@end
