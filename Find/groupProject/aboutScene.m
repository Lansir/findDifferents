//
//  aboutScene.m
//  Item
//
//  Created by  on 12-9-12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "aboutScene.h"
#import "MainMenu.h"
@implementation aboutScene
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[aboutScene node];
    [scene addChild:layer];
    return  scene;
}
- (id)init
{
    self = [super init];
    if (self)
    {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCSprite * about=[CCSprite spriteWithFile:@"dogsmile.png"];
        about.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:about];
               
        CCMenuItemImage *back=[CCMenuItemImage itemFromNormalImage:@"guideBack1.png"
                                                    selectedImage:@"guideBack2.png"
                                                           target:self
                                                          selector:@selector(onBack)];
        CCMenu *menu=[CCMenu menuWithItems:back, nil];
        menu.position=ccp(winSize.width/7,winSize.height/4);
        [self addChild:menu];
    }
    return self;
}
-(void) onBack
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1.0f scene:[MainMenu node]]];//x轴翻入（左右）
}

-(void) menuItem2Touched:(id)sender
{
	CCLOG(@"item 2 touched: %@", sender);
}

-(void) menuItem3Touched:(id)sender
{
    CCLOG(@"item 3 touched: %@", sender);
}

-(void) menuItemTouched:(id)sender
{
    CCLOG(@"item  touched: %@", sender);
}
-(void) menuItem4Touched:(id)sender
{
    [self goBackToPreviousScene];
	CCLOG(@"item 4 touched: %@", sender);
}

-(void)dealloc
{
    [super dealloc];
}@end
