//
//  PKGame.m
//  Item
//
//  Created by administrator on 12-9-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "PKGame.h"
#import "IntroLayer.h"
#import "MainMenu.h"
#import "SimpleAudioEngine.h"
#import "GameSuccessEndScene.h"
#import "GameFaildEndScene.h"

@implementation PKGame
@synthesize currentSession;
@synthesize haveFindArray;
@synthesize findImage1Array;
@synthesize findImage2Array;
@synthesize findImage3Array;

GKPeerPickerController *picker;
+(CCScene *)scene
{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[PKGame node];
    [scene addChild:layer];
    return  scene;
}

-(id)init
{
    if (self=[super init])
    {
        kkkk = 0;
        aaaa=1,bbbb=1,cccc=1;
        callScene=1;
        findNumber = 0;
        oppFindNumber = 0;
        haveFindArray = [[NSMutableArray alloc]init ];
        
        self.findImage1Array = [NSMutableArray arrayWithObjects:
                                @"187",@"168",@"417",@"168",
                                @"134",@"264",@"364",@"264",
                                @"55",@"166",@"285",@"166",
                                @"226",@"46",@"456",@"46",
                                @"124",@"40",@"354",@"40",//
                                @"190",@"26",@"420",@"26", nil];
        
        self.findImage2Array = [NSMutableArray arrayWithObjects:
                                @"130",@"78",@"340",@"71",//
                                @"208",@"85",@"438",@"85",//
                                @"188",@"262",@"418",@"262",//
                                @"147",@"184",@"377",@"184",//
                                @"44",@"21",@"274",@"21",nil];
        
        
        self.findImage3Array= [NSMutableArray arrayWithObjects:
                               @"68",@"156",@"298",@"156",//
                               @"132",@"169",@"362",@"169",//
                               @"102",@"77",@"332",@"77",
                               @"59",@"42",@"289",@"42",
                               @"184",@"164",@"414",@"164",nil];
        //蓝牙开启
        [self btnConnect];
            winSize=[CCDirector sharedDirector].winSize;
            self.isTouchEnabled=YES;
            [self findImage1];
            totalTime=160;
            timeLabel=[CCLabelTTF labelWithString:@"160" fontName:@"Arial" fontSize:36];
            timeLabel.color=ccc3(255,0,0);
            timeLabel.position=CGPointMake(winSize.width/480*240,winSize.height/320*294);
            [self addChild:timeLabel];
            
            myScoreNum = [CCSprite spriteWithFile:@"num0.png"];
            myScoreNum.position = ccp(winSize.width/480*330,winSize.height/320*298);
            [self addChild:myScoreNum z:1 tag:111];
            
            opponentScoreNum = [CCSprite spriteWithFile:@"num0.png"];
            opponentScoreNum.position = ccp(winSize.width/480*420,winSize.height/320*298);
            [self addChild:opponentScoreNum z:1 tag:222];
            
            CCSprite *maohao = [CCSprite spriteWithFile:@"colon.png"];
            maohao.position = ccp(winSize.width/480*378,winSize.height/320*298);
            [self addChild:maohao];
        
            //三个放大镜的初始化
            CCMenuItemImage *zoom1= [ CCMenuItemImage itemFromNormalImage:@"zoom.png"
                                                            selectedImage:@"zoom2.png"
                                                                   target:self
                                                                 selector:@selector(zoom11:)];
            CCMenu *menu1 = [CCMenu menuWithItems:zoom1, nil];
            [menu1 alignItemsVerticallyWithPadding:10.0f];
            menu1.position = ccp(winSize.width/480*100,winSize.height/320*298);
            [self addChild:menu1];
            
            CCMenuItemImage *zoom2= [ CCMenuItemImage itemFromNormalImage:@"zoom.png"
                                                            selectedImage:@"zoom2.png"
                                                                   target:self
                                                                 selector:@selector(zoom22:)];
            CCMenu *menu2 = [CCMenu menuWithItems:zoom2, nil];
            [menu2 alignItemsVerticallyWithPadding:10.0f];
            menu2.position = ccp(winSize.width/480*140,winSize.height/320*298);
            [self addChild:menu2];
            
            
            CCMenuItemImage *zoom3= [ CCMenuItemImage itemFromNormalImage:@"zoom.png"
                                                            selectedImage:@"zoom2.png"
                                                                   target:self
                                                                 selector:@selector(zoom33:)];
            CCMenu *menu3 = [CCMenu menuWithItems:zoom3, nil];
            [menu3 alignItemsVerticallyWithPadding:10.0f];
            menu3.position = ccp(winSize.width/480*180,winSize.height/320*298);
            [self addChild:menu3];
            
         [ [SimpleAudioEngine sharedEngine]playBackgroundMusic:@"PKBackground.wav" loop:YES];
           //音乐图片的初始化
            CCMenuItemImage *item= [ CCMenuItemImage itemFromNormalImage:@"soundON.png"
                                                           selectedImage:@"soundON11.png"
                                                                  target:self
                                                                selector:@selector(open:)];
            menu = [CCMenu menuWithItems:item, nil];
            [menu alignItemsVerticallyWithPadding:10.0f];
            menu.position = ccp(winSize.width/480*30,winSize.height/320*298);
            [self addChild:menu z:1 tag:1];
        
            
            [CDAudioManager sharedManager].backgroundMusic.volume = 0.8f;//音量大小
            [self schedule:@selector(update:) interval:0.3f];
        }
        return self;
}

-(void)findImage1
{
    CCSprite *gamepic1=[CCSprite spriteWithFile:@"pk1.png"];
    gamepic1.position=ccp(winSize.width/2,(winSize.height/320)*145);
    [self addChild:gamepic1];
}

-(void)findImage2
{
    sleep(0.5);
    CCSprite *gamepic2=[CCSprite spriteWithFile:@"pk2.png"];
    gamepic2.position=ccp(winSize.width/2,(winSize.height/320)*145);
    [self addChild:gamepic2];
}

-(void)findImage3
{
    sleep(0.5);
    CCSprite *gamepic3=[CCSprite spriteWithFile:@"pk3.png"];
    gamepic3.position=ccp(winSize.width/2,(winSize.height/320)*145);
    [self addChild:gamepic3];
}

//初始时音乐是打开的，执行了这个方法就关闭音乐同时切换了图片
-(void) open:(id)sender
{
    [self removeChildByTag:1 cleanup:NO];
    CCMenuItemImage *item1= [ CCMenuItemImage itemFromNormalImage:@"soundOFF.png"
                                                    selectedImage:@"soundOFF11.png"
                                                           target:self
                                                         selector:@selector(close:)];
    menu1 = [ CCMenu menuWithItems:item1, nil ];
    menu1.position = ccp(winSize.width/480*30,winSize.height/320*298);
    [ self addChild:menu1 z:2 tag:2];
    [[SimpleAudioEngine sharedEngine]pauseBackgroundMusic];
    [[SimpleAudioEngine sharedEngine]stopEffect:xx];
}
//执行了上面的方法，音乐被关闭了，执行这个方法音乐继续播放同时切换了图片
-(void) close:(id)sender
{
    [self removeChildByTag:2 cleanup:YES];
    CCMenuItemImage *item2= [CCMenuItemImage itemFromNormalImage:@"soundON.png"
                                                   selectedImage:@"soundON11.png"
                                                          target:self
                                                        selector:@selector(open:)];
     menu = [ CCMenu menuWithItems:item2, nil ];
    menu.position = ccp(winSize.width/480*30,winSize.height/320*298);
    [ self addChild:menu z:1 tag:1];
    [[SimpleAudioEngine sharedEngine]resumeBackgroundMusic];
}

-(void)zoom11:(id)sender
{
    if (aaaa==1)
    {
        [self zoomHelp:nil];
        CCSprite *zoom2 = [CCSprite spriteWithFile:@"zoom2.png"];
        zoom2.position = ccp(winSize.width/480*100,winSize.height/320*298);
        [self addChild:zoom2];
        aaaa=0;
    }
}
-(void)zoom22:(id)sender
{
    if (bbbb==1)
    {
        [self zoomHelp:nil];
        CCSprite *zoom2 = [CCSprite spriteWithFile:@"zoom2.png"];
        zoom2.position = ccp(winSize.width/480*140,winSize.height/320*298);
        [self addChild:zoom2];
        bbbb=0;
    }
}
-(void)zoom33:(id)sender
{
    if (cccc==1)
    {
        [self zoomHelp:nil];
        CCSprite *zoom2 = [CCSprite spriteWithFile:@"zoom2.png"];
        zoom2.position = ccp(winSize.width/480*180,winSize.height/320*298);
        [self addChild:zoom2];
        cccc=0;
    }
}
//放大镜帮助
-(void)zoomHelp:(id)sender
{
    if (findNumber<5)
    {
        BOOL bofound;
        float xx1,yy1,xx2,yy2;
        int i=0;
        do {
            xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
            yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
            xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
            yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
            bofound = [haveFindArray containsObject:[NSString stringWithFormat:@"%f",xx1]];
            i++;
        } while (bofound);
        [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:xx1 PDl_Y:yy1];
    }
    if (findNumber>5&&findNumber<10)
    {
        BOOL bofound;
        float xx1,yy1,xx2,yy2;
        int i=0;
        do {
            xx1 = [[findImage2Array objectAtIndex:4*i+0] floatValue];
            yy1 = [[findImage2Array objectAtIndex:4*i+1] floatValue];
            xx2 = [[findImage2Array objectAtIndex:4*i+2] floatValue];
            yy2 = [[findImage2Array objectAtIndex:4*i+3] floatValue];
            
            bofound = [haveFindArray containsObject:[NSString stringWithFormat:@"%f",xx1]];
            i++;
            
        } while (bofound);
        [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:xx1 PDl_Y:yy1];
    }
    if (findNumber>10&&findNumber<15)
    {
        BOOL bofound;
        float xx1,yy1,xx2,yy2;
        int i=0;
        do {
            xx1 = [[findImage3Array objectAtIndex:4*i+0] floatValue];
            yy1 = [[findImage3Array objectAtIndex:4*i+1] floatValue];
            xx2 = [[findImage3Array objectAtIndex:4*i+2] floatValue];
            yy2 = [[findImage3Array objectAtIndex:4*i+3] floatValue];
            
            bofound = [haveFindArray containsObject:[NSString stringWithFormat:@"%f",xx1]];
            i++;
            
        } while (bofound);
        [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:xx1 PDl_Y:yy1];
    }
}

////倒计时 0.1运行一次
-(void)update:(ccTime)delta
{
    if (kkkk==1)
    {
        totalTime-=delta;
    }
        currentTime=(int)totalTime;
        [timeLabel setString:[NSString stringWithFormat:@"%i",currentTime]];
    
    
    if (findNumber==5&&callScene == 1)
    {
        sleep(0.5);
        for (int i =0; i<100; i++)
        {
            [self removeChildByTag:123 cleanup:YES];
        }
        callScene=callScene+1;
        [self findImage2];
        [self removeChildByTag:123 cleanup:YES];
    }
    else if (findNumber==10&&callScene == 2)
    {
        sleep(0.5);
        for (int i =0; i<100; i++)
        {
            [self removeChildByTag:123 cleanup:YES];
        }
        callScene=callScene+1;
        [self findImage3];
    }
    
    //胜利
    else if (findNumber == 15)
    {
        [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitCols transitionWithDuration:1.5f scene:[GameSuccessEndScene scene]]];// 竖条切换进入
    }
    //失败
    else if (oppFindNumber ==15)
    {
        [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitRows transitionWithDuration:1.5f scene:[GameFaildEndScene scene]]];//横条切换进入
    }
    //时间结束，都没完成游戏
    else if (currentTime<1&&findNumber<15&&oppFindNumber<15)
    {
        CGSize Size=[[CCDirector sharedDirector]winSize];
        Label = [CCLabelTTF labelWithString:@"Game  Over" fontName:@"Arial" fontSize:48];
        Label.color=ccRED;
        Label.position = CGPointMake(Size.width/2, Size.height/2);
        [self addChild:Label];
        [self unscheduleAllSelectors];
    }
    
    //发给对手自己找到的个数
    [self btnSend:[NSString stringWithFormat:@"%d",findNumber]];
}

-(CGPoint) locationFromTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector]convertToGL:touchLocation];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int mmmm = findNumber;
    CGPoint location = [self locationFromTouches:touches];
    switch(callScene)
    {
        case 1:
        {
            float xx1,xx2,yy1,yy2;
            float lo_X = location.x;
            float lo_Y = location.y;
            for (int i = 0; i<6; i++)
            {
                xx1 = [[findImage1Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage1Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage1Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage1Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
        case 2:
        {
            
            
            float xx1,xx2,yy1,yy2;
            float lo_X = location.x;
            float lo_Y = location.y;
            
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage2Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage2Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage2Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage2Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
            
        }
        case 3:
        {
            
            float lo_X = location.x;
            float lo_Y = location.y;
            float xx1,xx2,yy1,yy2;
            
            for (int i = 0; i<5; i++)
            {
                xx1 = [[findImage3Array objectAtIndex:4*i+0] floatValue];
                yy1 = [[findImage3Array objectAtIndex:4*i+1] floatValue];
                xx2 = [[findImage3Array objectAtIndex:4*i+2] floatValue];
                yy2 = [[findImage3Array objectAtIndex:4*i+3] floatValue];
                [self PDx1:xx1 PDy1:yy1 PDx2:xx2 PDy2:yy2 PDl_X:lo_X PDl_Y:lo_Y];
            }
            break;
        }
    }
    if (mmmm==findNumber&&location.y<(winSize.height/320)*260)
    {
        
        CCScaleTo* scale0 = [CCScaleTo actionWithDuration:0.3 scale:1.1];
        CCScaleTo* scale1 = [CCScaleTo actionWithDuration:0.3 scale:0.9];
        [[SimpleAudioEngine sharedEngine] playEffect:@"Error.mp3"];
        //错误画叉
        CCSprite *eSprite = [CCSprite spriteWithFile:@"SelectError.png"];
        eSprite.position = ccp(location.x, location.y);
        CCSequence* goldSequence = [CCSequence actions:scale0, scale1,[CCCallFuncO actionWithTarget:self selector:@selector(afterShow:) object:eSprite], nil];
        [eSprite runAction:goldSequence];
        [self addChild:eSprite z:3 tag:123 ];
        totalTime = totalTime -3;
        currentTime = currentTime-3;
    }
}
-(void) afterShow:(id)sender
{
    CCSprite *sp = sender;
    [self removeChild:sp cleanup:NO];
}
-(void)PDx1:(float)x1 PDy1:(float)y1 PDx2:(float)x2 PDy2:(float)y2 PDl_X:(float)l_X PDl_Y:(float)l_Y
{
    if ((l_X>x1-15 && l_X< x1+15 && l_Y> y1-15 && l_Y< y1+15 )||(l_X >x2-15 && l_X<x2+15 && l_Y>y2-15 && l_Y<y2+15))
    {
        //判定是否存在x1
        BOOL found = [haveFindArray containsObject:[NSString stringWithFormat:@"%f",x1]];
        if (!found)
        {
            CCSprite *s1 = [CCSprite spriteWithFile:@"SelectTrue.png"];
            s1.position = ccp(x1, y1);
            [self addChild:s1 z:1 tag:123 ];
            CCSprite *s2 = [CCSprite spriteWithFile:@"SelectTrue.png"];
            s2.position = ccp(x2, y2);
            [self addChild:s2 z:2 tag:123 ];
            [haveFindArray addObject:[NSString stringWithFormat:@"%f",x1]];
            findNumber++;
            xx = [[SimpleAudioEngine sharedEngine] playEffect:@"True.mp3"];
            
            //数字加1
            [self removeChildByTag:1 cleanup:YES];
            NSString *myStr = [NSString stringWithFormat:@"num%d.png",findNumber];
            for (int i =0; i<3; i++)
            {
                [self removeChildByTag:111 cleanup:YES];
            }

            myScoreNum = [CCSprite spriteWithFile:myStr];
            myScoreNum.position = ccp(winSize.width/480*330,winSize.height/320*298);
            [self addChild:myScoreNum z:1 tag:111];
        }
    }
}

////////////////蓝牙部分///////////

//GKPeerPickerController类提供了一个标准的UI让你的应用程序
//发现并连接到其它蓝牙设备，连接方法并不难，首先实现一个btnConnect:类
-(void)btnConnect
{
    picker = [[GKPeerPickerController alloc]init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [picker show];
}

//检测到远程蓝牙设备，用户选择并连接到其中一个蓝牙设备时，
//调用peerPickerController:didConnectPeer:toSession:方法，
-(void)peerPickerController:(GKPeerPickerController *)picker
             didConnectPeer:(NSString *)peerID
                  toSession:(GKSession *)session
{
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler:self withContext:nil];
    picker.delegate = nil;
    [picker dismiss];
    [picker autorelease];
}

//如果用户取消了蓝牙选择器，调用peerPickerControllerDidCancel:方法
-(void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:1 scene:[MainMenu node]]];
    picker.delegate = nil;
    [picker autorelease];
}

//如果要从一个设备断开连接，使用来自GKSession对象的disconnectFromAllPeers方法
-(void)btnDisconnect
{
    [self.currentSession disconnectFromAllPeers];
   // [self.currentSession release];
    currentSession = nil;
}

//　　连接设备或断开连接时，调用session:peer:didChangeState:方法
-(void)session:(GKSession *)session
          peer:(NSString *)peerID
didChangeState:(GKPeerConnectionState)state
{
    switch (state)
    {
        case GKPeerStateConnected:
        {
            break;
        }
        case GKPeerStateDisconnected:
        {
            //[self.currentSession release];
            currentSession = nil;
            break;
        }
        default:
            break;
    }
}

//为了向连接的蓝牙设备发送数据，需要使用到GKSession对象的sendDataToAllPeers:方法，
//你发送的数据是通过NSData对象 传输的，因此你可以自定义你的应用程序协议和发送的数据类型(如二进制数据)，
-(void)mySendDataToPeers:(NSData *)data
{
    if (currentSession)
    {
        [self.currentSession sendDataToAllPeers:data
                                   withDataMode:GKSendDataReliable
                                          error:nil];
    }
}

//再定义btnSend:方法，以便用户输入的数据能够发送到远程设备：
-(void)btnSend:(NSString *)FNumber
{
    //---convert an NSString objecttoNSData---22 23
    NSData *data;
    NSString *str = [NSString stringWithString:FNumber];
    data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self mySendDataToPeers:data];
    
    //    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

}

//当设备接收到数据时，调用receiveData:fromPeer:inSession:context:方法
-(void)receiveData:(NSData *)data
          fromPeer:(NSString *)peer
         inSession:(GKSession *)session
           context:(void *)context
{
    //--convert the NSData toNSString--10 11
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSString *myStr = [NSString stringWithFormat:@"num%@.png",str];
    if ([str isEqualToString:@"0"])
    {
        kkkk=1;
    }
    oppFindNumber = [str intValue];
    [str release];
    for (int i =0; i<3; i++)
    {
        [self removeChildByTag:222 cleanup:YES];
    }
    opponentScoreNum = [CCSprite spriteWithFile:myStr];
    opponentScoreNum.position = ccp(winSize.width/480*420, winSize.height/320*298);
    [self addChild:opponentScoreNum z:1 tag:222];
    
    
    
    
}
-(void) dealloc
{
    [super dealloc];
    [haveFindArray release];
    [findImage1Array release];
    [findImage2Array release];
}
@end

