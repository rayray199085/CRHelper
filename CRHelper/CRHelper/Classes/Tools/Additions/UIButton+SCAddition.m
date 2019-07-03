//
//  UIButton+UIButton_extension.m
//  MySinaWeibo
//
//  Created by Stephen Cao on 21/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UIButton+SCAddition.h"

@implementation UIButton (UIButton_extension)
+(instancetype)imageButtonWithNormalImageName:(NSString *)normalImage andWithHighlightedImageName:(NSString *)highlightedImage{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    return button;
}
+(instancetype)imageButtonWithImageName:(NSString *)imageName andBackgroundImageName:(NSString *)bgImageName{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [button sizeToFit];
    return button;
}
    +(instancetype)textButtonWithTitle:(NSString *)title andWithFontSize:(CGFloat)size andWithNormalColor:(UIColor *)nColor andWithHighlightColor:(UIColor *)hColor{
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:size];
        [button setTitleColor:nColor forState:UIControlStateNormal];
        [button setTitleColor:hColor forState:UIControlStateHighlighted];
        [button sizeToFit];
        return button;
    }
+(instancetype)textButtonWithTitle:(NSString *)title andWithFontSize:(CGFloat)size andWithNormalColor:(UIColor *)nColor andWithHighlightColor:(UIColor *)hColor andWithBackgroundImageName:(NSString *)imageName{
    UIButton *button = [UIButton textButtonWithTitle:title andWithFontSize:size andWithNormalColor:nColor andWithHighlightColor:hColor];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button sizeToFit];
    return button;
}
-(void)imageButtonWithNormalImageName:(NSString *)normalImage andWithHighlightedImageName:(NSString *)highlightedImage{
    [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [self sizeToFit];
}
@end
