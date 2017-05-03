//
//  QWeiboAsyncApi.h
//  QWeiboSDK4iOSDemo
//
//  Created   on 11-1-18.
//   
//

#import <Foundation/Foundation.h>
#import "QWeiboSyncApi.h"


@interface QWeiboAsyncApi : NSObject {

}

//这两个方法没有用到
-(NSURLConnection *)addFriendWithConsumerKey:(NSString *)aConsumeKey
                         consumerSercret:(NSString *)aConsumerSercert
                              accessTokenKey:(NSString *)aAccessTokenKey
                           accessTokenSecret:(NSString *)aAccessTokenSecret
                                  resultType:(ResultType)aResultType
                                   name:(NSString *)aName
                                    delegate:(id)aDelegate;

- (NSURLConnection *)getHomeMsgWithConsumerKey:(NSString *)aConsumerKey
						 consumerSecret:(NSString *)aConsumerSecret 
						 accessTokenKey:(NSString *)aAccessTokenKey 
					  accessTokenSecret:(NSString *)aAccessTokenSecret 
							 resultType:(ResultType)aResultType 
							  pageFlage:(PageFlag)aPageFlag 
								nReqNum:(NSInteger)aReqNum 
							   delegate:(id)aDelegate;







- (NSURLConnection *)publishMsgWithConsumerKey:(NSString *)aConsumerKey 
						 consumerSecret:(NSString *)aConsumerSecret 
						 accessTokenKey:(NSString *)aAccessTokenKey 
					  accessTokenSecret:(NSString *)aAccessTokenSecret 
								content:(NSString *)aContent 
							  imageFile:(NSString *)aImageFile 
							 resultType:(ResultType)aResultType 
							   delegate:(id)aDelegate;

@end
