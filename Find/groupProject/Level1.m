//
//  Level1.m
//  Item
//
//  Created by administrator on 12-9-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Level1.h"
#import "TransitionScene.h"
#import "GameFaildEndScene.h"
#import "SimpleAudioEngine.h"
static int l1_x;
static  NSMutableArray *picLevel1;
static int count=1;
@implementation Level1
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[Level1 node];
    [scene addChild:layer];
    return  scene;
}
-(id)init
{
    if ([picLevel1 count] ==3)
    {
        picLevel1=[[NSMutableArray alloc]init];
    }
    l1_x=arc4random()%11+1;
    while (l1_x %2 ==0 ||l1_x==0 || [NSString stringWithFormat:@"%d",l1_x]==[picLevel1 objectAtIndex:count-1])
    {
        l1_x=arc4random()%11+2;
    }
    [picLevel1 addObject:[NSString stringWithFormat:@"%d",l1_x]];
    if (self=[super init])
    {
        findNumber = 0;
         haveFindArray = [[NSMutableArray alloc]init ];
        [CDAudioManager sharedManager].backgroundMusic.volume = 1.0f;
        CGSize winSize=[CCDirector sharedDirector].winSize;
        CCSprite *gamepic1=[CCSprite spriteWithFile:[NSString stringWithFormat:@"%d.png",l1_x]];
        gamepic1.position=ccp(winSize.width/2,winSize.height/2-15);
        [self addChild:gamepic1];
               
        CCSprite *progress=[CCSprite spriteWithFile:@"progress.png"];
        progress.position=ccp(winSize.width/480*185,winSize.height/320*300);
        [self addChild:progress];
        self.isTouchEnabled=YES;
        totalTime=55;
        timeLabel=[CCLabelTTF labelWithString:@"55" fontName:@"Verdana-Italic" fontSize:30];
        timeLabel.color=ccGREEN;
        timeLabel.position=CGPointMake(winSize.width/480*15,winSize.height/320*300);
        [self addChild:timeLabel];
        
        CCSprite *sprite1=[CCSprite spriteWithFile:@"GreenStar.png"];
        sprite1.position=ccp(winSize.width/480*350, winSize.height/320*300);
        [self addChild:sprite1];
        
        CCSprite *sprite2=[CCSprite spriteWithFile:@"GreenStar.png"];
        sprite2.position=ccp(winSize.width/480*375,winSize.height/320*300);
        [self addChild:sprite2];
        
        CCSprite *sprite3=[CCSprite spriteWithFile:@"GreenStar.png"];
        sprite3.position=ccp(winSize.width/480*400,winSize.height/320*300);
        [self addChild:sprite3];
        
        CCSprite *sprite4=[CCSprite spriteWithFile:@"GreenStar.png"];
        sprite4.position=ccp(winSize.width/480*425,winSize.height/320*300);
        [self addChild:sprite4];
        
        CCSprite *sprite5=[CCSprite spriteWithFile:@"GreenStar.png"];
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
    if (currentTime<=0)
    {
        count=1;
        [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitRows transitionWithDuration:2 scene:[GameFaildEndScene node]]];//扇形转换－
        [self unscheduleAllSelectors];
    }
}

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
    float xx1,xx2,yy1,yy2;
    float lo_X = location.x;
    float lo_Y = location.y;
    switch (l1_x)
    {
        case 1:
        {
            NSArray *myNSA1 = [NSArray arrayWithObjects:
                               @"15",@"103",@"245",@"98",
                               @"162",@"29",@"392",@"29",
                               @"113",@"198",@"343",@"198",
                               @"129",@"136",@"359",@"136",
                               @"205",@"252",@"435",@"252",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
            
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
        case 3:
        {
            NSArray *myNSA1 = [NSArray arrayWithObjects:
                               @"56",@"44",@"286",@"44",
                               @"147",@"31",@"377",@"29",
                               @"191",@"80",@"421",@"80",
                               @"203",@"101",@"433",@"100",
                               @"212",@"190",@"442",@"180",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
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
        case 5:
        {
            NSArray *myNSA1= [NSArray arrayWithObjects:
                              @"20",@"226",@"250",@"222",
                              @"16",@"157",@"246",@"129",
                              @"103",@"252",@"333",@"256",
                              @"141",@"256",@"371",@"257",
                              @"193",@"239",@"423",@"245",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
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
        case 7:
        {
            NSArray *myNSA1= [NSArray arrayWithObjects:
                              @"69",@"178",@"299",@"178",
                              @"208",@"281",@"438",@"281",
                              @"204",@"101",@"434",@"101",
                              @"86",@"103",@"316",@"103",
                              @"122",@"126",@"352",@"126",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
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
        case 9:
        {
            NSArray *myNSA1= [NSArray arrayWithObjects:
                              @"182",@"279",@"412",@"279",
                              @"53",@"65",@"283",@"65",
                              @"215",@"114",@"445",@"114",
                              @"74",@"228",@"304",@"228",
                              @"166",@"231",@"396",@"231",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
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
        case 11:
        {
            NSArray *myNSA1= [NSArray arrayWithObjects:
                              @"205",@"234",@"435",@"234",
                              @"160",@"84",@"390",@"84",
                              @"233",@"50",@"463",@"50",
                              @"228",@"185",@"458",@"185",
                              @"71",@"37",@"301",@"37",nil];
            findImage1Array = [CCArray  arrayWithNSArray:myNSA1];
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
-(void)PDx1:(float)x1 PDy1:(float)y1 PDx2:(float)x2 PDy2:(float)y2 PDl_X:(float)l_X PDl_Y:(float)l_Y
{
    CGSize winSize=[[CCDirector sharedDirector]winSize];
    if ((l_X>x1-15 && l_X< x1+15 && l_Y> y1-15 && l_Y< y1+15 )||(l_X >x2-15 && l_X<x2+15 && l_Y>y2-15 && l_Y<y2+15))
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
                    sprite.position=ccp(winSize.width/480*350,winSize.height/320* 300);
                    [self addChild:sprite];
                    break;
                }
                case 2:
                {
                    CCSprite *sprite=[CCSprite spriteWithFile:@"OrangeStarReally.png"];
                    sprite.position=ccp(winSize.width/480*375,winSize.height/320* 300);
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
                     count++;
                    [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeDown transitionWithDuration:1.0f scene:[TransitionScene node]]];
                    break;
                }
                default:
                    break;
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
