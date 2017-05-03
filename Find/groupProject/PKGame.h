//
//  PKGame.h
//  Item
//
//  Created by administrator on 12-9-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"

@interface PKGame : CCLayer<UIApplicationDelegate>
{
    CCMenu *menu;
    CCMenu *menu1;
    int xx;
    GKSession *currentSession;
    
    CGSize winSize;
    CCSprite *pointSprite;
//    NSMutableArray *findImage1Array;
//    NSMutableArray *findImage2Array;
//    NSMutableArray *findImage3Array;
//    NSMutableArray *haveFindArray;//把已经找到的点放到此数组里
    int findNumber;//记录找到的个数
    CCLabelTTF *timeLabel;//得分的显示标签
    float totalTime;//用于跟踪时间的变化
    int currentTime;
    CCLabelTTF * Label;
    int callScene;
    
    CCSprite *myScoreNum;//屏幕显示的自己分数
    CCSprite *opponentScoreNum;//屏幕显示的对手分数
    int oppFindNumber;//记录对手找到个数
    
    int aaaa,bbbb,cccc;
    
    int kkkk;
}

@property(nonatomic,retain)GKSession *currentSession;
@property (nonatomic,retain) NSMutableArray *findImage1Array;
@property (nonatomic,retain) NSMutableArray *findImage2Array;
@property (nonatomic,retain) NSMutableArray *findImage3Array;
@property (nonatomic,retain) NSMutableArray *haveFindArray;//把已经找到的点放到此数组里

-(void)btnSend:(NSString *)FNumber;//发送
-(void)btnConnect;//连接
-(void)btnDisconnect;//断开


-(id)init;
+(CCScene *)scene;
-(void)drawChecked:(CCSprite *) s;
-(CGRect)AtlasRect:(CCSprite *)atlSpr;
-(void)PDx1:(float)x1 PDy1:(float)y1  PDx2:(float)x2
       PDy2:(float)y2 PDl_X:(float)l_X PDl_Y:(float)l_Y;

-(void)findImage1;
-(void)findImage2;
-(void)findImage3;



@end