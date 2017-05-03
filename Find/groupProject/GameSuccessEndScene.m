//
//  GameSuccessEndScene.m
//  Item
//
//  Created by administrator on 12-9-21.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameSuccessEndScene.h"
#import "MainMenu.h"
#import "ConnectQQ.h"
#import "SimpleAudioEngine.h"
#import "GameEntryScene.h"
@implementation GameSuccessEndScene
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[GameSuccessEndScene node];
    [scene addChild:layer];
    return  scene;
}

-(id)init
{
    if (self=[super init])
    {
        [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];//暂停背景音乐
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCSprite *sprite2=[CCSprite spriteWithFile:@"rabbitWin.png"];
        sprite2.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:sprite2];
        
        CCMenuItemImage *share=[CCMenuItemImage itemFromNormalImage:@"redRightShare.png" selectedImage:@"greenRightShare.png" target:self selector:@selector(onShare:)];
        CCMenu *menu1=[CCMenu menuWithItems:share, nil];
        menu1.position=ccp(winSize.width/4*3,winSize.height/320*140);
        [self addChild:menu1];
        
        CCMenuItemImage *restart=[CCMenuItemImage itemFromNormalImage:@"redRightRestart.png" selectedImage:@"greenRightRestart.png" target:self selector:@selector(onReStart:)];
        CCMenu *menu2=[CCMenu menuWithItems:restart, nil];
        menu2.position=ccp(winSize.width/5*4,winSize.height/320*50);
        [self addChild:menu2];
        
        }
    return self;
}

-(void) onShare:( id )sender
{
    ConnectQQ *connect=[[ConnectQQ alloc]init];
    EAGLView *view=[[CCDirector sharedDirector]openGLView];
    [view addSubview:connect.view];
}
-(void)onReStart:(id)sender
{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionJumpZoom transitionWithDuration:2.0f scene:[GameEntryScene node]]];//跳动进入
}

-(void)dealloc
{
    [super dealloc];
}
@end
