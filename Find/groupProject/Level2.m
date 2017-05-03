
//
//  Level2.m
//  Item
//
//  Created by  on 12-9-12.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Level2.h"
#import "TransitionScene.h"
#import "GameFaildEndScene.h"
#import "GameSuccessEndScene.h"
#import "SimpleAudioEngine.h"

@implementation Level2
static int l2_x;
static  NSMutableArray *picLevel2;
static int count=1;
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[Level2 node];
    [scene addChild:layer];
    return  scene;
}
-(id)init
{
    if ([picLevel2 count] ==3)
    {
        picLevel2=[[NSMutableArray alloc]init];
    }
    l2_x=arc4random()%13;
    while (l2_x %2 ==1 ||l2_x==0 || [NSString stringWithFormat:@"%d",l2_x]==[picLevel2 objectAtIndex:count-1])
    {
        l2_x=arc4random()%11+2;
    }
    [picLevel2 addObject:[NSString stringWithFormat:@"%d",l2_x]];
    if (self=[super init])
    {
        findNumber = 0;
        haveFindArray = [[NSMutableArray alloc]init ];
        [CDAudioManager sharedManager].backgroundMusic.volume = 1.0f;
        CGSize winSize=[CCDirector sharedDirector].winSize;
        CCSprite *gamepic1=[CCSprite spriteWithFile:[NSString stringWithFormat:@"%d.png",l2_x]];
        gamepic1.position=ccp(winSize.width/2,winSize.height/320*145);
        [self addChild:gamepic1];
        
        CCSprite *progress=[CCSprite spriteWithFile:@"progress.png"];
        progress.position=ccp(winSize.width/480*185,winSize.height/320*300);
        [self addChild:progress];
        self.isTouchEnabled=YES;
        totalTime=55;
        timeLabel=[CCLabelTTF labelWithString:@"55" fontName:@"MarkerFelt-Thin" fontSize:30];
        timeLabel.color=ccc3(255,0,0);
        timeLabel.position=CGPointMake(winSize.width/480*15,winSize.height/320*300);
        [self addChild:timeLabel];
        CCSprite *sprite1=[CCSprite spriteWithFile:@"BlueStar.png"];
        sprite1.position=ccp(winSize.width/480*350,winSize.height/320*300);
        [self addChild:sprite1];
        
        CCSprite *sprite2=[CCSprite spriteWithFile:@"BlueStar.png"];
        sprite2.position=ccp(winSize.width/480*375,winSize.height/320*300);
        [self addChild:sprite2];
        
        CCSprite *sprite3=[CCSprite spriteWithFile:@"BlueStar.png"];
        sprite3.position=ccp(winSize.width/480*400,winSize.height/320*300);
        [self addChild:sprite3];
        
        CCSprite *sprite4=[CCSprite spriteWithFile:@"BlueStar.png"];
        sprite4.position=ccp(winSize.width/480*425,winSize.height/320*300);
        [self addChild:sprite4];
        
        CCSprite *sprite5=[CCSprite spriteWithFile:@"BlueStar.png"];
        sprite5.position=ccp(winSize.width/480*450,winSize.height/320*300);
        [self addChild:sprite5];
        [self scheduleUpdate];
    }
    return self;
}

//倒计时
-(void)update:(ccTime)delta
{
    CGSize winSize=[[CCDirector sharedDirector]winSize];
    totalTime-=delta; 
    currentTime=(int)totalTime;
    [timeLabel setString:[NSString stringWithFormat:@"%i",currentTime]];
    CCSprite *button=[CCSprite spriteWithFile:@"button.png"];
    button.position=ccp(winSize.width/480*(50+5*currentTime),winSize.height/320*300);
    [self addChild:button];
    if (currentTime==0)
    {
        count=1;
         [[CCDirector sharedDirector]replaceScene:[CCTransitionSlideInT transitionWithDuration:2 scene:[GameFaildEndScene node]]];//下侧进入（视觉感觉是屏幕上移）
        [self unscheduleAllSelectors];
    }
}

//Touch Input Events
-(CGPoint) locationFromTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector]convertToGL:touchLocation];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int mmmm=findNumber;
    location = [self locationFromTouches:touches];
    float lo_X = location.x;
    float lo_Y = location.y;
    float xx1,xx2,yy1,yy2;
    switch (l2_x)
    {
        case 2:
        {
            NSArray *myNSA = [NSArray arrayWithObjects:
                              @"119",@"266",@"349",@"266",
                              @"195",@"159",@"425",@"159",
                              @"128",@"148",@"358",@"148",
                              @"191",@"97",@"421",@"97",
                              @"82",@"86",@"312",@"86",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA];
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
        case 4:
        {
            NSArray *myNSA = [NSArray arrayWithObjects:
                              @"112",@"82",@"342",@"82",
                              @"186",@"102",@"416",@"102",
                              @"115",@"241",@"345",@"241",
                              @"163",@"141",@"393",@"141",
                              @"227",@"117",@"457",@"117",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA];
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
      case 6:
       {
           NSArray *myNSA = [NSArray arrayWithObjects:
                             @"74",@"121",@"304",@"121",
                             @"224",@"95",@"454",@"95",
                             @"64",@"37",@"294",@"37",
                             @"112",@"231",@"342",@"231",
                             @"219",@"140",@"449",@"140",nil];
           findImage1Array = [CCArray  arrayWithNSArray:myNSA];
           for (int i = 0; i<5; i++)
           {
               xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
               yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
               xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
               yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
               [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
           }
           break;
       }
        case 8:
        {
            NSArray *myNSA = [NSArray arrayWithObjects:
                              @"121",@"104",@"351",@"104",
                              @"173",@"135",@"403",@"135",
                              @"109",@"149",@"339",@"149",
                              @"178",@"279",@"408",@"279",
                              @"216",@"179",@"446",@"179",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA];
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
        case 10:
        {
            NSArray *myNSA = [NSArray arrayWithObjects:
                              @"225",@"34",@"455",@"34",
                              @"156",@"109",@"386",@"109",
                              @"129",@"282",@"359",@"282",
                              @"19",@"196",@"249",@"196",
                              @"105",@"74",@"335",@"74",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA];
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
        case 12:
        {
            NSArray *myNSA = [NSArray arrayWithObjects:
                              @"18",@"86",@"248",@"186",
                              @"70",@"195",@"300",@"195",
                              @"217",@"264",@"447",@"264",
                              @"171",@"35",@"401",@"35",
                              @"234",@"68",@"464",@"68",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA];
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
    }
    if (mmmm==findNumber&&location.y<260)
    {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCScaleTo* scale0 = [CCScaleTo actionWithDuration:0.3 scale:1.1];
        CCScaleTo* scale1 = [CCScaleTo actionWithDuration:0.3 scale:0.9];
        //[[SimpleAudioEngine sharedEngine] playEffect:@"Error.mp3"];
        //错误画叉
        CCSprite *eSprite = [CCSprite spriteWithFile:@"SelectError.png"];
        eSprite.position = ccp(location.x, location.y);
        CCSequence* goldSequence = [CCSequence actions:scale0, scale1,[CCCallFuncO actionWithTarget:self selector:@selector(afterShow:) object:eSprite], nil];
        [eSprite runAction:goldSequence];
        [self addChild:eSprite z:3 tag:123 ];
        totalTime = totalTime-3;
        for (int i = 0; i<3; i++)
        {
            currentTime = currentTime-1;
            CCSprite *button=[CCSprite spriteWithFile:@"button.png"];
            button.position=ccp(winSize.width/480*(50+5*currentTime),winSize.height/320*300);
            [self addChild:button];
        }
    }
}
-(void) afterShow:(id)sender
{
    CCSprite *sp = sender;
    [self removeChild:sp cleanup:NO];
}
-(void)PDx1:(float)x1 PDy1:(float)y1  PDx2:(float)x2
       PDy2:(float)y2 PDl_X:(float)l_X PDl_Y:(float)l_Y;
{
    CGSize winSize=[[CCDirector sharedDirector]winSize];
    if ((l_X>x1-15&&l_X<x1+15&&l_Y>y1-15&&l_Y<y1+15)||(l_X>x2-15&&l_X<x2+15&&l_Y>y2-15&&l_Y<y2+15))
    {
        //判定是否存在x1
        BOOL found = [haveFindArray containsObject:[NSString stringWithFormat:@"%f",x1]];
        if (!found)
        {
            CCSprite *s1 = [CCSprite spriteWithFile:@"SelectTrue.png"];
            s1.position = ccp(x1, y1);
            [self addChild:s1 ];
            CCSprite *s2 = [CCSprite spriteWithFile:@"SelectTrue.png"];
            s2.position = ccp(x2, y2);
            [self addChild:s2 ];
            [haveFindArray addObject:[NSString stringWithFormat:@"%f",x1]];
            findNumber++;
            switch (findNumber)
            {
                case 1:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*350,winSize.height/320*300);
                    [self addChild:sprite];
                    break;
                }
                case 2:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*375,winSize.height/320*300);
                    [self addChild:sprite];
                    break;
                }
                case 3:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*400,winSize.height/320*300);
                    [self addChild:sprite];
                    break;
                }
                case 4:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*425,winSize.height/320*300);
                    [self addChild:sprite];
                    break;
                }
                case 5:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*450,winSize.height/320*300);
                    [self addChild:sprite];
                    if (count==3)
                    {
                        count=1;
                        [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeUp transitionWithDuration:2.0f scene:[GameSuccessEndScene node]]];//横条向上显示进入
                        break;
                    }
                    else
                    {
                        [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeDown transitionWithDuration:1.0f scene:[TransitionScene node]]];//从底部滑入
                        count=count+1;
                         break;
                    }
                }
            }
        }
    }
}

-(void) dealloc
{
    [super dealloc];
    [haveFindArray release];
}
@end
