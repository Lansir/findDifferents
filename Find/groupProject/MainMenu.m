//
//  MainMenu.m
//  Item
//
//  Created by administrator on 12-9-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainMenu.h"
#import "GameEntryScene.h"
#import "GameSecondEntryScene.h"
#import "PKGame.h"
#import "aboutScene.h"
#import "PKGame.h"
#import "SimpleAudioEngine.h"

@implementation MainMenu
-(id)init
{
    if (self=[super init])
    {
       [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"Web Background Music.mp3" loop:YES];
        CGSize winSize = [[CCDirector sharedDirector] winSize ];
        
		CCSprite *background = [CCSprite spriteWithFile:@"family.png" ];
		background.position = ccp( winSize.width/2, winSize.height/2 );
		[ self addChild:background ];
        
        CCMenuItemImage *search=[CCMenuItemImage itemFromNormalImage:@"starSearch.png" selectedImage:@"starSearch2.png" target:self selector:@selector(onSearch:)];
        CCMenu *menu1 = [CCMenu menuWithItems:search,nil ];
        menu1.position = ccp(winSize.width/10*9,winSize.height/20*15);
        [self addChild:menu1];

        CCMenuItemImage *fly=[CCMenuItemImage itemFromNormalImage:@"starFly.png" selectedImage:@"starFly2.png" target:self selector:@selector(onFly:)];
        CCMenu *menu2 = [CCMenu menuWithItems:fly,nil ];
        menu2.position = ccp(winSize.width/3,winSize.height/10*9);
        [self addChild:menu2];

        CCMenuItemImage *about=[CCMenuItemImage itemFromNormalImage:@"starAbout2.png" selectedImage:@"starAbout1.png" target:self selector:@selector(onAbout:)];
        CCMenu *menu3 = [CCMenu menuWithItems:about,nil ];
        menu3.position = ccp(winSize.width/9,winSize.height/5*4);
        [self addChild:menu3];
        
        CCMenuItemImage *pk=[CCMenuItemImage itemFromNormalImage:@"starPk2.png" selectedImage:@"starPk.png" target:self selector:@selector(onPK:)];
        CCMenu *menu4= [ CCMenu menuWithItems:pk,nil ];
        menu4.position = ccp(winSize.width/5*3,winSize.height/20*17);
        [self addChild:menu4];
    }
    return self;
}

-(void)onSearch:( id )sender
{
    CCTransitionTurnOffTiles * transition = [CCTransitionTurnOffTiles transitionWithDuration:1.0f scene:[GameEntryScene scene]];//近远－远近－－－－
    [[CCDirector sharedDirector] replaceScene:transition];
}

-(void)onFly:( id )sender
{
    CCTransitionTurnOffTiles * transition = [CCTransitionShrinkGrow transitionWithDuration:1.0f scene:[GameSecondEntryScene scene]];//近远－远近－－－－
    [[CCDirector sharedDirector] replaceScene:transition];
}

-(void)onPK:( id )sender
{
    CCTransitionShrinkGrow * transition = [CCTransitionShrinkGrow transitionWithDuration:1.0f scene:[PKGame scene]];///另一个layout左侧进入（视觉感觉是屏幕右移）
    [[CCDirector sharedDirector] replaceScene:transition];
}
-(void) onAbout:( id )sender
{
    CCTransitionSlideInL *transition = [CCTransitionSlideInL transitionWithDuration:1.0f scene:[aboutScene scene]];//左侧进入（视觉感觉是屏幕左移）
    [[CCDirector sharedDirector] replaceScene:transition];
}
-(void)dealloc
{
    [super dealloc];
}
@end
