//
//  Animation.m
//  item222
//
//  Created by  on 12-9-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Animation.h"


@implementation Animation
- (id)init
{
    self = [super init];
    if (self)
    {
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        NSMutableArray *frames1 = [[NSMutableArray array] retain];
        // 构造每一个帧的实际图像数据
        for (int i = 1; i <= 3; i++)
        {
            NSString *frameName = [NSString stringWithFormat:@"苍蝇%d.png", i];
            CCSpriteFrame *frame1 = [cache spriteFrameByName:frameName];
            [frames1 addObject:frame1];
        }
        // 使用CCAnimation和CCRepeatForever构造一个一直重复的动画
        NSString *firstFrameName = [NSString stringWithFormat:@"苍蝇%d.png", 1];
        id sprite1 = [CCSprite spriteWithSpriteFrameName:firstFrameName];
        
        CCAnimation *animation = [CCAnimation animationWithSpriteFrames:frames1 delay:0.15f ];
        [sprite1 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]]];
        // 将构造好的动画加入显示列表
        [self addChild:sprite1];
        [frames1 release];
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
}
@end
