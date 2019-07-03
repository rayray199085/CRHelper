//
//  UIColor+UIColor_extension.m
//  MySinaWeibo
//
//  Created by Stephen Cao on 21/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UIColor+SCAddition.h"

@implementation UIColor (UIColor_extension)
+(instancetype)colorWithHexValue:(NSInteger)hex{
    return [UIColor colorWithRed:((float)((hex & 0xff0000) >> 16))/255.0 green:((float)((hex & 0x00ff00) >> 8))/255.0 blue:((float)(hex & 0x0000ff))/255.0 alpha:1.0];
}
@end
