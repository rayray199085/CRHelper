//
//  UIButton+UIButton_extension.h
//  MySinaWeibo
//
//  Created by Stephen Cao on 21/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UIButton_extension)
    +(instancetype)imageButtonWithNormalImageName:(NSString *)normalImage andWithHighlightedImageName:(NSString *)highlightedImage;
    +(instancetype)imageButtonWithImageName:(NSString *)imageName andBackgroundImageName:(NSString *)bgImageName;
    +(instancetype)textButtonWithTitle:(NSString *)title andWithFontSize:(CGFloat)size andWithNormalColor:(UIColor *)nColor andWithHighlightColor:(UIColor *)hColor;
    +(instancetype)textButtonWithTitle:(NSString *)title andWithFontSize:(CGFloat)size andWithNormalColor:(UIColor *)nColor andWithHighlightColor:(UIColor *)hColor andWithBackgroundImageName:(NSString *)imageName;
    -(void)imageButtonWithNormalImageName:(NSString *)normalImage andWithHighlightedImageName:(NSString *)highlightedImage;
@end

NS_ASSUME_NONNULL_END
