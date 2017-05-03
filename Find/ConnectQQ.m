//
//  ConnectQQ.m
//  Item
//
//  Created by administrator on 12-9-14.
//
//

#import "ConnectQQ.h"
#import "QWeiboSyncApi.h"
#import "AppDelegate.h"
#import "QWeiboAsyncApi.h"
#import "cocos2d.h"
#import "MainMenu.h"

@implementation ConnectQQ

#define VERIFY_URL @"http://open.t.qq.com/cgi-bin/authorize?oauth_token="
@synthesize connection;
@synthesize responseData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    QWeiboSyncApi *api=[[[QWeiboSyncApi alloc]init]autorelease];
    AppController *app=(AppController *)[[UIApplication sharedApplication]delegate];
    NSString *retString=[api getRequestTokenWithConsumerKey:@"801235224" consumerSecret:@"86b7ca4e321dda94c129fd5c0a2b158f"];
    [app parseTokenKeyWithResponse:retString];
    CGRect frame=[[UIScreen mainScreen]bounds];
    mWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0.0f,0.0f,frame.size.height,frame.size.width)];
    mWebView.delegate = self;
    [self.view addSubview:mWebView];
    NSString *url = [NSString stringWithFormat:@"%@%@", VERIFY_URL, app.tokenKey];
    NSURL *requestUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    [mWebView loadRequest:request];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(NSString*) valueForKey:(NSString *)key ofQuery:(NSString*)query
{
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	for(NSString *aPair in pairs)
    {
		NSArray *keyAndValue = [aPair componentsSeparatedByString:@"="];
		if([keyAndValue count] != 2) continue;
		if([[keyAndValue objectAtIndex:0] isEqualToString:key])
        {
			return [keyAndValue objectAtIndex:1];
		}
	}
	return nil;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSString *query = [[request URL] query];
	NSString *verifier = [self valueForKey:@"oauth_verifier" ofQuery:query];
	if (verifier && ![verifier isEqualToString:@""])
    {
		AppController *app=(AppController *)[[UIApplication sharedApplication]delegate];
		QWeiboSyncApi *api = [[[QWeiboSyncApi alloc] init] autorelease];
		NSString *retString = [api getAccessTokenWithConsumerKey:app.appKey
												  consumerSecret:app.appSecret
												 requestTokenKey:app.tokenKey
											  requestTokenSecret:app.tokenSecret
														  verify:verifier];
		[app parseTokenKeyWithResponse:retString];
		[app saveDefaultKey];
        [self sendInfo];
		return NO;
	}
	return YES;
}

-(void)sendInfo
{
    if (flag==NO)
    {
        QWeiboAsyncApi *api=[[[QWeiboAsyncApi alloc]init]autorelease];
        AppController *app=(AppController *)[[UIApplication sharedApplication]delegate];
        NSString *content=@"矮油。。又通关了，我正在玩Find，找回童时的乐趣，倍好玩的，一般人我还不告诉他呦";
        NSString * fileName=[[NSBundle mainBundle]pathForResource:@"WeiboShareDefault" ofType:@"png"];
        self.connection=[api publishMsgWithConsumerKey:app.appKey
                                        consumerSecret:app.appSecret
                                        accessTokenKey:app.tokenKey
                                     accessTokenSecret:app.tokenSecret
                                               content:content
                                             imageFile:fileName
                                            resultType:RESULTTYPE_JSON
                                              delegate:self];
        flag=YES;
        [mWebView removeFromSuperview];
        [self.view removeFromSuperview];
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Share success"
                                                         message:@"Please select operation"
                                                        delegate:self
                                               cancelButtonTitle:@"Back Menu"
                                             otherButtonTitles:nil] autorelease];
        [alert show];
    }
}

//AlertView代理:
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@",[alertView buttonTitleAtIndex:buttonIndex]);
    if ([[alertView buttonTitleAtIndex:buttonIndex]isEqualToString:@"Back Menu"])
    {
        CCDirector *director=[CCDirector sharedDirector];
        CCScene *newScene = [MainMenu node];
        [director replaceScene:newScene];
    }
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	self.responseData = [NSMutableData data];
	NSLog(@"total = %lld", [response expectedContentLength]);
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	AppController *app=(AppController *)[[UIApplication sharedApplication]delegate];
	app.response = [[[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding] autorelease];
    self.connection = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	AppController *app=(AppController *)[[UIApplication sharedApplication]delegate];	
	app.response = [NSString stringWithFormat:@"connection error:%@", error];
    self.connection = nil;
}

@end
