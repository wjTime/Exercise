//
//  SGStatusTextView.m
//  关键字链接
//
//  Created by wenjie on 16/8/11.
//  Copyright © 2016年 test. All rights reserved.
//

#import "SGStatusTextView.h"

@implementation SGStatusTextView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UITextView *tv = [[UITextView alloc] init];
        
        // UITextView默认上面有20的内边距，应该修改textContainerInset
        tv.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
        tv.editable = NO;
        tv.scrollEnabled = NO;
        tv.userInteractionEnabled = NO;
        //self.userInteractionEnabled = NO;
        tv.backgroundColor = [UIColor clearColor];
        tv.font = [UIFont systemFontOfSize:12];
        tv.text = @"关键字点击超链接demo";
        [self addSubview:tv];
        _tv = tv;
    }
    
    return self;
    
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    
    _tv.attributedText = attributedText;
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _tv.frame = self.bounds;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint pt = [[touches anyObject] locationInView:self];
    BOOL selected = NO;
    NSLog(@"pt =   %lf  ,  %lf",pt.x,pt.y);
    NSRange range = [self.tv.text rangeOfString:[NSString stringWithFormat:@"%@", @"demo"]];
    self.tv.selectedRange = range;
    

    NSArray *rects = [self.tv selectionRectsForRange:self.tv.selectedTextRange];
        self.tv.selectedRange = NSMakeRange(0, 0); // 重置选中范围，只是为了使用选中范围来获取rect而不是真的选中。
        for (UITextSelectionRect *selectionRect in rects) {
            CGRect rect = selectionRect.rect;
            if (rect.size.width == 0 || rect.size.height == 0) continue;
            
            if (CGRectContainsPoint(rect, pt)) {
                selected = YES;
                break;
            }
            
        }
        
        if (selected) {
            for (UITextSelectionRect *selectionRect in rects) {
                CGRect rect = selectionRect.rect;
                if (rect.size.width == 0 || rect.size.height == 0) continue;
                
                UIView *cover = [[UIView alloc] initWithFrame:rect];
                cover.layer.cornerRadius = 5;
                cover.backgroundColor = [UIColor greenColor];
                //cover.tag = CoverTag;
                [self insertSubview:cover atIndex:0];
                [self dainjiguanjianzi];
            }
        }

}


- (void)dainjiguanjianzi{
    NSLog(@"--------点击了关键字----------");
}

@end
