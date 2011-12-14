#import "TestViewController.h"


@interface TestViewController ()

@property (nonatomic, copy) NSString *secretWord;

@end

@implementation TestViewController

@synthesize scrambledLabel = _scrambledLabel;
@synthesize descrambleAttempt = _descrambleAttempt;
@synthesize guessButton = _guessButton;
@synthesize secretWord = _secretWord;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    self.scrambledLabel = nil;
    self.descrambleAttempt = nil;
    self.guessButton = nil;
    self.secretWord = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_scrambledLabel setText:@"Welcome!"];
    _descrambleAttempt.delegate = self;
    _descrambleAttempt.autocorrectionType = UITextAutocorrectionTypeNo;
    _descrambleAttempt.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _descrambleAttempt.spellCheckingType = UITextSpellCheckingTypeNo;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTextField)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITextFieldDelegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self dismissTextField];
    [self checkWord];
    return YES;
}

#pragma mark - Custom methods
- (void)setWithScrambledWord:(NSString *)scrambled andAnswer:(NSString *)descrambled
{
    self.secretWord = descrambled;
    [self.scrambledLabel setText:scrambled];
}

- (void)dismissTextField
{
    [self.descrambleAttempt resignFirstResponder];
}

- (IBAction)checkWord
{
    if ([[self.descrambleAttempt text] isEqualToString:self.secretWord]) {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Hoorah!" message:nil delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] autorelease];
        [alert show];
    }
}

@end
