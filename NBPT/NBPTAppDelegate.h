@class TestViewController;

#import <UIKit/UIKit.h>

@interface NBPTAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> 

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) TestViewController *viewController;
@property (nonatomic, retain) NSURL *nagURL;

@end
