#import "NBPTAppDelegate.h"
#import "TestViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@implementation NBPTAppDelegate


@synthesize window=_window, viewController = viewController_, nagURL = nagURL_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    NSURL *url = [NSURL URLWithString:@"http://bhargava-tseng.appspot.com/DownloadableContent/test.json"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setCompletionBlock:^(void) {
        NSString *responseString = [request responseString];
        NSDictionary *responseDict = [responseString objectFromJSONString];
        
        BOOL nag = [[responseDict objectForKey:@"nag"] boolValue];
        NSString *message = [responseDict objectForKey:@"message"];
        self.nagURL = [NSURL URLWithString:[responseDict objectForKey:@"url"]];
        
        if (nag) {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Message" 
                                                             message:message 
                                                            delegate:self 
                                                   cancelButtonTitle:@"Cancel" 
                                                   otherButtonTitles:@"Go",nil] autorelease];
            [alert show];
        }

    }];
    
    [request startAsynchronous];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    self.window = nil;
    self.viewController = nil;
    [super dealloc];
}

#pragma mark UIAlertViewDelegate Method

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:self.nagURL];
    }
}

@end
