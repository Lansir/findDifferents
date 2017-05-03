//
//  TransitionScene.m
//  Item
//
//  Created by administrator on 12-9-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "TransitionScene.h"
#import "Level1.h"
#import "Level2.h"

@implementation TransitionScene
static int levelCount=0;
- (id)init
{
    self = [super init];
    if (levelCount %5==0)
    {
        levelCount=0;
    }
    if (self)
    {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
         CCMenuItemFont* item1 = [CCMenuItemFont itemFromString:@"CONTINUE" target:self selector:@selector(Touched:)];
        if (levelCount %2==1)
        {
            CCSprite * back=[CCSprite spriteWithFile:@"blueface.png"];
            back.position=CGPointMake(winSize.width/2,winSize.height/2);
            item1.color=ccBLUE;
            [self addChild:back];
        }
        else
        {
            CCSprite * back=[CCSprite spriteWithFile:@"redface.png"];
            back.position=CGPointMake(winSize.width/2,winSize.height/2);
            item1.color=ccYELLOW;
            [self addChild:back];
        }
        CCMenu *menu = [ CCMenu menuWithItems:item1, nil ];
        CCMoveTo *move1=[CCMoveTo actionWithDuration:0.2 position:ccp(winSize.width/3,-winSize.height/20*9)];
        CCMoveTo *move2=[CCMoveTo actionWithDuration:0.2 position:ccp(winSize.width/3+(winSize.width/480)*20,-winSize.height/20*9)];
        CCMoveTo *move3=[CCMoveTo actionWithDuration:0.2 position:ccp(winSize.width/3,-winSize.height/20*9)];
        CCSequence *sequence=[CCSequence actions:move1,move2,move3,nil];
        CCRepeatForever *repeat=[CCRepeatForever actionWithAction:sequence];
        [item1 runAction:repeat];
        [self addChild:menu];
    }
    return self;
}
-(void) Touched:( id )sender
{
    if (levelCount%2 ==1)
    {
        [[CCDirector sharedDirector]replaceScene:[CCTransitionSlideInR transitionWithDuration:0.5f scene:[Level1 node] ]]; //另一个layout上侧进入（视觉感觉是屏幕下移）
    }
    else
    {
        [[CCDirector sharedDirector]replaceScene:[CCTransitionSlideInL transitionWithDuration:0.5f scene:[Level2 node]]];//另一个layout下侧进入（视觉感觉是屏幕上移）
    }
    levelCount++;
}
-(void)dealloc
{
    [super dealloc];
}

@end
