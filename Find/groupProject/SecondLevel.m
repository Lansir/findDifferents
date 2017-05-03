//
//  SecondLevel.m
//  Item
//
//  Created by administrator on 12-9-20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondLevel.h"
#import "Animation.h"
#import "GameFaildEndScene.h"
#import "SimpleAudioEngine.h"
#import "GameSuccessEndScene.h"

@implementation SecondLevel
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[SecondLevel node];
    [scene addChild:layer];
    return  scene;
}
- (id)init
{
    currentcount=0;
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];//暂停背景音乐
    self = [super init];
    if (self) 
    {
        [self playBgMusic:@"PKBackground.wav"];
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCSprite * background=[CCSprite spriteWithFile:@"SecondBackground.png"];
        background.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:background];
        
        self.isTouchEnabled=YES;
        // 将png和plist导入 CCSpriteFrameCache（帧缓存），以便后续构造FliesSprite对象时直接使用缓存的数据
        CCSpriteFrameCache *cache=[CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"flies.plist"];
        CCSpriteBatchNode *mgr=[CCSpriteBatchNode batchNodeWithFile:@"flies.png" capacity:3];
        [self addChild:mgr];
        
        scoreLabel=[CCLabelTTF labelWithString:@"0" fontName:@"Verdana-Italic" fontSize:36];
        scoreLabel.color=ccYELLOW;
        scoreLabel.position=CGPointMake(winSize.width/480*450,winSize.height/320*300);
        [self addChild:scoreLabel];
        
        totalTime=60;
        timeLabel=[CCLabelTTF labelWithString:@"60" fontName:@"MarkerFelt-Thin" fontSize:36];
        timeLabel.color=ccRED;
        timeLabel.position=CGPointMake(winSize.width/480*30,winSize.height/320*300);
        [self addChild:timeLabel];
        
        chopsticks=[CCSprite spriteWithFile:@"chopsticks.png"];
        [self addChild: chopsticks];
        
        [self initFlies];
        
       [self schedule:@selector(update:) interval:0.5f];
    }
    return self;
}
//播放背景音乐
-( void )playBgMusic:(NSString*)fileName
{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:fileName];
}
//初始化精灵
-(void) initFlies
{
    array=[[NSMutableArray alloc]init] ;  
    for(int i=0;i<7;i++)
    { 
        Animation * sprite=[Animation node];
        CCLOG(@"%f  %f ",sprite.contentSize.width, sprite.contentSize.height);
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        sprite.position=ccp(winSize.width/480*(-30),winSize.height);
        [self addChild:sprite];
        [array addObject:sprite];
        CCLOG(@"%d",[array count]);
        [self actionSequence:sprite:i];
    }
}

-(void)updateSet:(ccTime)delta
{
    [self initFlies];
}

-(CGPoint) locationFromTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector]convertToGL:touchLocation];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int mmmm = currentcount;
    CGPoint location = [self locationFromTouches:touches];
    chopsticks.position=CGPointMake(location.x+15,location.y+20);
    [self sequence];
    if (mmmm == currentcount)
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"Error.mp3"];
    }
    else
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"True.mp3"];
    }
}
-(void) sequence
{
    CCScaleTo* scale0 = [CCScaleTo actionWithDuration:0.3 scale:1.6];
    CCScaleTo* scale1 = [CCScaleTo actionWithDuration:0.3 scale:1.2];
    CCSequence* goldSequence = [CCSequence actions:scale0, scale1,[CCCallFuncO actionWithTarget:self selector:@selector(afterShow1) object:chopsticks], nil];
    [chopsticks runAction:goldSequence];
}
-(void) afterShow1
{
}

-(void) actionSequence:(CCSprite *)spider:(int)k
{
    if(k==0)
    {
        float duration = CCRANDOM_0_1() * 1+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(300, -50)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(0, -180)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-180, 10)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-50, 180)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else if(k==1)
    {
        float duration = CCRANDOM_0_1() * 2+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(50, -180)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(240,120)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-150,-135)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-50, 180)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else if(k==2)
    {
        float duration = CCRANDOM_0_1() * 1.5+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(25,-200)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(166,265)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-50,-190)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-199, 140)];
        CCMoveBy* move5 = [CCMoveBy actionWithDuration:duration position:CGPointMake(260, -180)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,move5,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else if(k==3)
    {
        float duration = CCRANDOM_0_1() * 0.5+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(40,-150)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(100,265)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-100,-150)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(200, 150)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else if(k==4)
    {
        float duration = CCRANDOM_0_1() * 0.5+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(140,-150)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(100,-169)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-100,-170)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-160, 150)];
        CCMoveBy* move5 = [CCMoveBy actionWithDuration:duration position:CGPointMake(250, 300)];
        CCMoveBy* move6 = [CCMoveBy actionWithDuration:duration position:CGPointMake(300, -150)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,move5,move6,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else if(k==5)
    {
        float duration = CCRANDOM_0_1() * 2+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(50, -180)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(240,120)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-180,-150)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-50, 180)];
        CCMoveBy* move5 = [CCMoveBy actionWithDuration:duration position:CGPointMake(280, -175)];
        CCMoveBy* move6 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-160, 150)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,move5,move6,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    else
    {
        float duration = CCRANDOM_0_1() * 0.5+ 1;
        CCMoveBy* move1 = [CCMoveBy actionWithDuration:duration position:CGPointMake(10,-250)];
        CCMoveBy* move2 = [CCMoveBy actionWithDuration:duration position:CGPointMake(300,-169)];
        CCMoveBy* move3 = [CCMoveBy actionWithDuration:duration position:CGPointMake(-140,-100)];
        CCMoveBy* move4 = [CCMoveBy actionWithDuration:duration position:CGPointMake(150, 250)];
        CCSequence* sequence = [CCSequence actions:move1, move2, move3, move4,nil];
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction:sequence];
        [spider runAction:repeat];
    }
    [self schedule:@selector(updateSet:)interval:8.0f];
}


-(void)update:(ccTime)delta
{
    totalTime-=delta; 
    currentTime=(int)totalTime;
    [timeLabel setString:[NSString stringWithFormat:@"%i",currentTime]];
    [self checkForCollision];
    if(currentTime==0 &&currentcount <500)
    {
        sleep(0.5);
        [[CCDirector sharedDirector]replaceScene:[CCTransitionShrinkGrow transitionWithDuration:2.0f scene:[GameFaildEndScene node]]];//交替进入
    }
    else if(currentcount >=500)
    {
        sleep(0.5);
        [[CCDirector sharedDirector]replaceScene:[CCTransitionJumpZoom transitionWithDuration:2.0f scene:[GameSuccessEndScene node]]];//跳动进入
    }
}
//碰撞事件的检测
-(void) checkForCollision

{
    CCScaleTo* scale0 = [CCScaleTo actionWithDuration:0.3 scale:1.1];
    CCScaleTo* scale1 = [CCScaleTo actionWithDuration:0.3 scale:0.9];
    CGSize winSize=[[CCDirector sharedDirector]winSize];
    CGRect  position = CGRectMake(chopsticks.position.x-(chopsticks.contentSize.width/2)+(winSize.width/480)*10.0f, chopsticks.position.y-(chopsticks.contentSize.height/2)+(winSize.height/320)*10.0f, chopsticks.contentSize.width-(winSize.width/480)*100.0f, chopsticks.contentSize.height-(winSize.height/320)*100.0f) ;
    for(Animation * sprite in array)
    {
        CGRect  pos=CGRectMake(sprite.position.x-(sprite.contentSize.width), sprite.position.y-(sprite.contentSize.height/2), sprite.contentSize.width, sprite.contentSize.height);
        if(CGRectIntersectsRect(position,pos))
        {
            currentcount=currentcount+5;
            [scoreLabel setString:[NSString stringWithFormat:@"%i",currentcount]];
            CCSprite *score=[CCSprite spriteWithFile:@"+5.png"];
           score.position=CGPointMake(chopsticks.position.x-10,chopsticks.position.y-20);
            CCSequence* goldSequence = [CCSequence actions:scale0, scale1,[CCCallFuncO actionWithTarget:self selector:@selector(afterShow:) object:score], nil];
            [score runAction:goldSequence];
            [self addChild:score];
            sprite.visible=NO;
        }
    }   
}

-(void) afterShow:(id)sender
{
    CCSprite *sp = sender;
    [self removeChild:sp cleanup:NO];
}
-(void) onEnter
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	// must call super here:
	[super onEnter];
}

-(void) onEnterTransitionDidFinish
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	// must call super here:
	[super onEnterTransitionDidFinish];
}

-(void) onExit
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	// must call super here:
	[super onExit];
}
-(void) dealloc
{
    [array release];
    [super dealloc];
}
@end
