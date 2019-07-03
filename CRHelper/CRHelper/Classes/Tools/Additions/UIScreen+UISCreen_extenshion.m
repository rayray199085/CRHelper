//
//  UIScreen+UISCreen_extenshion.m
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 16/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UIScreen+SCAddition.h"

@implementation UIScreen (UISCreen_extenshion)
+(CGFloat) screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}
+(CGFloat) screenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}
+(CGFloat) screenScale{
    return [UIScreen mainScreen].scale;
}
@end
