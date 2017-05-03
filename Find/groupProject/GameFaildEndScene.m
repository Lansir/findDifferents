//
//  GameFaildEndScene.m
//  Item
//
//  Created by administrator on 12-9-21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameFaildEndScene.h"
#import "ConnectQQ.h"
#import "SimpleAudioEngine.h"
#import "MainMenu.h"

@implementation GameFaildEndScene
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[GameFaildEndScene node];
    [scene addChild:layer];
    return  scene;
}
-(id)init
{
    if (self=[super init])
    {
         [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];//暂停背景音乐
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCSprite *sprite=[CCSprite spriteWithFile:@"rabbitsit.png"];
        sprite.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:sprite];
        
        CCMenuItemImage *guide1=[CCMenuItemImage  itemFromNormalImage:@"guideEndBack1.png" selectedImage:@"guideEndBack2.png" target:self selector:@selector(onBack:)];
        CCMenu *menu = [ CCMenu menuWithItems:guide1, nil];
        menu.position=ccp(winSize.width/7, winSize.height/3);
        [self addChild:menu];
    }
    return self;
}

-(void)onBack:(id)sender
{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionMoveInR transitionWithDuration:1.0f scene:[MainMenu node]]];
}
-(void)dealloc
{
    [super dealloc];
}
@end
