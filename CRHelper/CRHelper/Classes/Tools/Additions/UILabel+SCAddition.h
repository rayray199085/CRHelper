//
//  UILabel+UILabel_extension.h
//  MySinaWeibo
//
//  Created by Stephen Cao on 22/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (UILabel_extension)
+(instancetype)labelWithText:(NSString *)text andWithFontSize:(CGFloat)fontSize andColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
