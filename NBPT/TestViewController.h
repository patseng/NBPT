#import <UIKit/UIKit.h>


@interface TestViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UILabel *scrambledLabel;
@property (nonatomic, retain) IBOutlet UITextField *descrambleAttempt;
@property (nonatomic, retain) IBOutlet UIButton *guessButton;

- (void)setWithScrambledWord:(NSString *)scrambled andAnswer:(NSString *)descrambled;
- (void)dismissTextField;
- (IBAction)checkWord;

@end
