//
//  UIImageView+UIImageView_extension.m
//  MySinaWeibo
//
//  Created by Stephen Cao on 22/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UIImageView+SCAddition.h"

@implementation UIImageView (UIImageView_extension)
+(instancetype)imageViewWithFitImageName:(NSString *)imageName;{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [imageView sizeToFit];
    return imageView;
}
-(void)setCircleImage{
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.layer.masksToBounds = YES;
}
@end
