//
//  UIImageView+UIImageView_extension.h
//  MySinaWeibo
//
//  Created by Stephen Cao on 22/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (UIImageView_extension)
-(void)setCircleImage;
+(instancetype)imageViewWithFitImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
