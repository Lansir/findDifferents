//
//  Level1.h
//  Item
//
//  Created by administrator on 12-9-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Level1 : CCLayer
{
    CCSprite *pointSprite;
    CCArray *findImage1Array;
    NSMutableArray *haveFindArray;//把已经找到的点放到此数组里
    int findNumber;//记录找到的个数
    CCLabelTTF *timeLabel;//时间的显示标签
    float totalTime;//用于跟踪时间的变化
    int currentTime;
    CCLabelTTF * Label;
    CGPoint location;
}
-(id)init;
+(CCScene *)scene;
//-(void)drawChecked:(CCSprite *) s;
//-(CGRect)AtlasRect:(CCSprite *)atlSpr;
-(void)PDx1:(float)x1 PDy1:(float)y1  PDx2:(float)x2
       PDy2:(float)y2 PDl_X:(float)l_X PDl_Y:(float)l_Y;
@end
