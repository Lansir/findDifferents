//
//  MainMenu.h
//  Item
//
//  Created by administrator on 12-9-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainMenu : CCLayer
{
}
// 下面声明的四个方法是菜单的四个选项，开始游戏，排行榜，设置，关于
- ( void ) onStartGame: ( id )sender;
- ( void ) onChange: ( id )sender;
- ( void ) onExit: ( id )sender;
- ( void ) onAbout: ( id )sender;
@end
