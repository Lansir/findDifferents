//
//  AppDelegate.h
//  Item
//
//  Created by administrator on 12-9-11.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;
	CCDirectorIOS	*director_;
}


@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *tokenKey;
@property (nonatomic, copy) NSString *tokenSecret;
@property (nonatomic, copy) NSString *verifier;
@property (nonatomic, copy) NSString *response;

- (void)parseTokenKeyWithResponse:(NSString *)response;
- (void)loadDefaultKey;
- (void)saveDefaultKey;

@end
