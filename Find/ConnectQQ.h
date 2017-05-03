//
//  ConnectQQ.h
//  Item
//
//  Created by administrator on 12-9-14.
//
//

#import <UIKit/UIKit.h>

@interface ConnectQQ : UIViewController<UIWebViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIWebView *mWebView;
    NSURLConnection *connection;
    NSMutableData *responseData;
    BOOL flag;
}
@property (nonatomic, retain) NSURLConnection	*connection;
@property (nonatomic, retain) NSMutableData		*responseData;
-(void)sendInfo;

@end
