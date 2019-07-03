//
//  UILabel+UILabel_extension.m
//  MySinaWeibo
//
//  Created by Stephen Cao on 22/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UILabel+SCAddition.h"

@implementation UILabel (UILabel_extension)
+(instancetype)labelWithText:(NSString *)text andWithFontSize:(CGFloat)fontSize andColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    [label sizeToFit];
    return label;
}
@end
