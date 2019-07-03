//
//  CABasicAnimation+CABasicAnimation_extension.h
//  MySinaWeibo
//
//  Created by Stephen Cao on 23/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CABasicAnimation (CABasicAnimation_extension)
+(instancetype)doRotateAnimWithRepeatCount:(CGFloat)count andWithDuration:(CFTimeInterval)interval andWithShouldRemoveOnCompletion:(Boolean) isTrue;
@end

NS_ASSUME_NONNULL_END
