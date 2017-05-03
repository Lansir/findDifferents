//
//  GameEntryScene.m
//  Item
//
//  Created by administrator on 12-9-20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameEntryScene.h"
#import "Level1.h"

@implementation GameEntryScene
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[GameEntryScene node];
    [scene addChild:layer];
    return  scene;
}
-(id)init
{
    if (self =[super init])
    {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        [CCMenuItemFont setFontSize:32];
        CCMenuItemFont* item1 = [CCMenuItemFont itemFromString:@"START" target:self selector:@selector(Touched:)];
        item1.position=ccp(winSize.width/3,-winSize.height/20*9);
        CCSprite * UI=[CCSprite spriteWithFile:@"smilemouth.png"];
        UI.position=CGPointMake(winSize.width/2,winSize.height/2);
        [self addChild:UI];
        item1.color=ccRED;
        
        CCMenu *menu = [ CCMenu menuWithItems:item1, nil ];
        CCMoveTo *move1=[CCMoveTo actionWithDuration:0.1 position:ccp(winSize.width/3,-winSize.height/20*9)];
        CCMoveTo *move2=[CCMoveTo actionWithDuration:0.1 position:ccp(winSize.width/3+20,-winSize.height/20*9)];
        CCMoveTo *move3=[CCMoveTo actionWithDuration:0.1 position:ccp(winSize.width/3,-winSize.height/20*9)];
        CCSequence *sequence=[CCSequence actions:move1,move2,move3,nil];
        CCRepeatForever *repeat=[CCRepeatForever actionWithAction:sequence];
        [item1 runAction:repeat];
        [self addChild:menu];
    }
    return self;
}

-(void) Touched:( id )sender
{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionSlideInT transitionWithDuration:1.0f scene:[Level1 node]]];//扇形转换－－－－－
}

-(void)dealloc
{
    [super dealloc];
}
@end
