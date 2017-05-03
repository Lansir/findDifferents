//
//  SecondLevel.h
//  Item
//
//  Created by administrator on 12-9-20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SecondLevel : CCLayer {
    CCSprite *flies;
    CCSprite *chopsticks;
     NSMutableArray * array;
    CGPoint *playerVelocity;
    float actualDistance;
    CCLabelTTF *scoreLabel;//得分标签
    int currentcount;
    CCLabelTTF *timeLabel;//时间标签
    int currentTime;
    float totalTime;//用于跟踪时间的变化
}
-(id)init;
+(CCScene *)scene;
@end
