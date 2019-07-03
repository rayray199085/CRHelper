//
//  CABasicAnimation+CABasicAnimation_extension.m
//  MySinaWeibo
//
//  Created by Stephen Cao on 23/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "CABasicAnimation+SCAddition.h"

@implementation CABasicAnimation (CABasicAnimation_extension)
+(instancetype)doRotateAnimWithRepeatCount:(CGFloat)count andWithDuration:(CFTimeInterval)interval andWithShouldRemoveOnCompletion:(Boolean) isTrue{
    CABasicAnimation *anim = [CABasicAnimation animation];
    [anim setKeyPath:@"transform.rotation"];
    [anim setToValue:[NSNumber numberWithDouble:M_PI * 2]];
    anim.repeatCount = count;
    anim.duration = interval;
    [anim setRemovedOnCompletion:isTrue];
    return anim;
}
@end
